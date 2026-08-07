.class public Ll/c8t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/c8t;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/c8t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage$Type;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/c8t;->b:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerLiveId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerLiveId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerUserId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserAvatar()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerUserAvatar:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerUserName:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToLiveId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toLiveId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserId:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserAvatar()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserAvatar:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserName:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getShowSeconds()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    int-to-long v0, v0

    .line 104
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->showSeconds:J

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteMessage;->getMultiCallInvite()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerMultiCallOrder()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerMultiCallOrder:Ljava/lang/String;

    .line 115
    .line 116
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c8t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c8t;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
