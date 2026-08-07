.class public Ll/awk0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessage;->new_()Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "video.chat.notify.push"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageContent;->new_()Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 23
    .line 24
    const v1, 0xf4240

    .line 25
    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 28
    .line 29
    const-string v1, "\u6765\u7535\u8bdd\u5566"

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const/4 v2, 0x6

    .line 39
    invoke-static {p0, v2}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "\u5411\u4f60\u53d1\u8d77\u89c6\u9891\u95ea\u804a\uff0c\u5feb\u53bb\u63a5\u542c"

    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 59
    .line 60
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 61
    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    long-to-double v1, v1

    .line 67
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 68
    .line 69
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpCQU83SFdJNE1WUFBQRE5EUEtSQVZMSE9HT0hTWTE0IiwidyI6NjAwLCJoIjo2MDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1ODU2NDg4OTEwNzE5MTA4Njg5fQ.png"

    .line 70
    .line 71
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 72
    .line 73
    const/4 p0, 0x0

    .line 74
    invoke-static {v0, p0}, Ll/cft;->d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
