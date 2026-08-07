.class public Ll/gou;
.super Ll/xgu;
.source "SourceFile"

# interfaces
.implements Ll/twl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/gou;",
        ">;",
        "Ll/twl;"
    }
.end annotation


# instance fields
.field public final f:Ljava/lang/String;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "LivingJsBridgePlug:"

    .line 5
    .line 6
    iput-object p1, p0, Ll/gou;->f:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S2(Ll/gou;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gou;->U2(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/alu;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/alu;-><init>(Ll/knu;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Ll/iiv;->c(Ll/twl;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/fou;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/fou;-><init>(Ll/gou;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final T2(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "isAnchor() is "

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", and live id is "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/xnu;->s()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Ll/cxk;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string v0, "data() || data().getLive() == null."

    .line 56
    .line 57
    invoke-static {v0}, Ll/cxk;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Ll/gou;->g:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Ll/gou;->g:Ljava/lang/String;

    .line 69
    .line 70
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 104
    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->roomId:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 116
    .line 117
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->liveId:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 128
    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->anchorId:Ljava/lang/String;

    .line 130
    .line 131
    const-string v1, "videoChat"

    .line 132
    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->roomType:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->fakeId:Ljava/lang/String;

    .line 140
    .line 141
    const-string v1, "normal"

    .line 142
    .line 143
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->liveMode:Ljava/lang/String;

    .line 144
    .line 145
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveJsRoomInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 146
    .line 147
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Ll/gou;->g:Ljava/lang/String;

    .line 152
    .line 153
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_3
    :goto_1
    const-string p0, "{}"

    .line 158
    .line 159
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public final U2(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "calling"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Ll/gou;->g:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public f0(Ll/bcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;->c()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j1(ZLl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/gou;->T2(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ll/iiv;->a(Ll/twl;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/gou;->g:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method
