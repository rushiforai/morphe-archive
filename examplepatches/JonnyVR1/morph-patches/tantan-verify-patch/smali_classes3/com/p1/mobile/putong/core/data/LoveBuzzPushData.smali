.class public Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "LoveBuzzPushUser"


# instance fields
.field public appId:Ljava/lang/String;

.field public biz:Ljava/lang/String;

.field public buzzIntent:Ljava/lang/String;

.field public buzzToken:Ljava/lang/String;

.field public channelKey:Ljava/lang/String;

.field public channelToken:Ljava/lang/String;

.field public contentId:Ljava/lang/String;

.field public frozenDuration:I

.field public initialDuration:I

.field public memojiDuration:I

.field public mode:Ljava/lang/String;

.field public needReact:Z

.field public otherUsers:Ljava/lang/String;

.field public prolongCount:I

.field public reaction:Ljava/lang/String;

.field public resolutionHeight:I

.field public resolutionWidth:I

.field public subType:Ljava/lang/String;

.field public totalDuration:I

.field public userId:Ljava/lang/String;

.field public vendor:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LoveBuzzPushData{userId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->userId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', biz=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->biz:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', buzzToken=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->buzzToken:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', buzzIntent=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->buzzIntent:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', contentId=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->contentId:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', channelToken=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->channelToken:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', channelKey=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->channelKey:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', initialDuration="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->initialDuration:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", prolongCount="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->prolongCount:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", appId=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->appId:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', vendor="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->vendor:I

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

.method public transDataFromPush(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->userId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->biz:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->buzzToken:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->buzzIntent:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->contentId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->channelToken:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->channelKey:Ljava/lang/String;

    .line 32
    .line 33
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    .line 34
    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->vendor:I

    .line 36
    .line 37
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->appId:Ljava/lang/String;

    .line 40
    .line 41
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    .line 42
    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->initialDuration:I

    .line 44
    .line 45
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    .line 46
    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->prolongCount:I

    .line 48
    .line 49
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    .line 50
    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->totalDuration:I

    .line 52
    .line 53
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    .line 54
    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->frozenDuration:I

    .line 56
    .line 57
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    .line 58
    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->resolutionWidth:I

    .line 60
    .line 61
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    .line 62
    .line 63
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->resolutionHeight:I

    .line 64
    .line 65
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->mode:Ljava/lang/String;

    .line 68
    .line 69
    iget-boolean p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    .line 70
    .line 71
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->needReact:Z

    .line 72
    .line 73
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->reaction:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->subType:Ljava/lang/String;

    .line 80
    .line 81
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->otherUsers:Ljava/lang/String;

    .line 84
    .line 85
    iget p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    .line 86
    .line 87
    iput p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->memojiDuration:I

    .line 88
    .line 89
    return-void
.end method
