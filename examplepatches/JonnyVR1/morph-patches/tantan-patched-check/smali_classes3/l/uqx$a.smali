.class public Ll/uqx$a;
.super Ll/enw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uqx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uqx;


# direct methods
.method public constructor <init>(Ll/uqx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/enw;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic l0(Ll/uqx$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqx$a;->q0()V

    return-void
.end method

.method public static synthetic m0(Ll/uqx$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqx$a;->p0()V

    return-void
.end method

.method public static synthetic n0(Ll/uqx$a;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uqx$a;->o0(Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/enw;->A(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onUserOffline "

    .line 7
    .line 8
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "channel:"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, ",reason:"

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "onUserOffline"

    .line 48
    .line 49
    invoke-virtual {p3, p2, p1}, Ll/qzm0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ll/rqx;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ll/rqx;-><init>(Ll/uqx$a;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public Z(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/enw;->Z(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 19
    .line 20
    invoke-static {p1}, Ll/uqx;->n(Ll/uqx;)Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 p2, 0x2

    .line 35
    if-eq p1, p2, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/uqx;->F()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 46
    .line 47
    invoke-static {p0}, Ll/uqx;->n(Ll/uqx;)Lrx/subjects/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public a0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/enw;->a0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onUserOffline "

    .line 7
    .line 8
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "uid:"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, ",reason:"

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "onUserOffline"

    .line 48
    .line 49
    invoke-virtual {p3, p2, p1}, Ll/qzm0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ll/tqx;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ll/tqx;-><init>(Ll/uqx$a;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public e0([Lcom/immomo/mediacore/audio/AudioVolumeWeight;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Ll/enw;->e0([Lcom/immomo/mediacore/audio/AudioVolumeWeight;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    array-length v1, p1

    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    move v1, v0

    .line 16
    :goto_0
    array-length v2, p1

    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    aget-object v2, p1, v1

    .line 20
    .line 21
    const-string v3, "user:"

    .line 22
    .line 23
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v3, "-"

    .line 30
    .line 31
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v3, v2, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 35
    .line 36
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, "value:"

    .line 40
    .line 41
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v2, v2, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 45
    .line 46
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, "#"

    .line 50
    .line 51
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    aget-object v1, p1, v0

    .line 58
    .line 59
    iget v1, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->totalVolume:I

    .line 60
    .line 61
    const-string v2, "total:"

    .line 62
    .line 63
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    aget-object p1, p1, v0

    .line 67
    .line 68
    iget p1, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->totalVolume:I

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    move v1, v0

    .line 75
    :goto_1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v2, "onAudioVolumeIndication:"

    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p1, v2, p2}, Ll/qzm0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    int-to-long p1, v1

    .line 89
    invoke-static {}, Ll/uqx;->u()J

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    cmp-long p1, p1, v1

    .line 94
    .line 95
    if-lez p1, :cond_4

    .line 96
    .line 97
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/uqx;->w()Ll/t54;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    sget-object p2, Ll/t54;->g:Ll/t54;

    .line 104
    .line 105
    if-ne p1, p2, :cond_4

    .line 106
    .line 107
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 108
    .line 109
    invoke-static {p1}, Ll/uqx;->o(Ll/uqx;)J

    .line 110
    .line 111
    .line 112
    move-result-wide p1

    .line 113
    const-wide/16 v1, 0x2

    .line 114
    .line 115
    cmp-long p1, p1, v1

    .line 116
    .line 117
    iget-object p2, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 118
    .line 119
    if-ltz p1, :cond_2

    .line 120
    .line 121
    invoke-static {p2, v0}, Ll/uqx;->r(Ll/uqx;Z)V

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_2
    invoke-static {p2}, Ll/uqx;->p(Ll/uqx;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_3

    .line 130
    .line 131
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 132
    .line 133
    invoke-static {p1}, Ll/uqx;->o(Ll/uqx;)J

    .line 134
    .line 135
    .line 136
    move-result-wide p1

    .line 137
    invoke-static {}, Ll/uqx;->t()J

    .line 138
    .line 139
    .line 140
    move-result-wide v1

    .line 141
    cmp-long p1, p1, v1

    .line 142
    .line 143
    if-ltz p1, :cond_3

    .line 144
    .line 145
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/uqx;->r(Ll/uqx;Z)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/qzm0;->l()V

    .line 151
    .line 152
    .line 153
    :cond_3
    :goto_2
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 154
    .line 155
    invoke-static {p1}, Ll/uqx;->p(Ll/uqx;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    iget-object p0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 162
    .line 163
    invoke-static {p0}, Ll/uqx;->o(Ll/uqx;)J

    .line 164
    .line 165
    .line 166
    move-result-wide p1

    .line 167
    const-wide/16 v0, 0x1

    .line 168
    .line 169
    add-long/2addr p1, v0

    .line 170
    invoke-static {p0, p1, p2}, Ll/uqx;->q(Ll/uqx;J)V

    .line 171
    .line 172
    .line 173
    :cond_4
    return-void
.end method

.method public o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/sqx;

    .line 5
    .line 6
    invoke-direct {p1, p0, p2}, Ll/sqx;-><init>(Ll/uqx$a;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic o0(Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 2
    .line 3
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;->what:I

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/uqx;->S(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/uqx;->V()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/uqx;->S(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uqx;->V()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/uqx;->S(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uqx;->V()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/enw;->z(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "onJoinChannelSuccess "

    .line 5
    .line 6
    invoke-static {p1}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p1, p2}, Ll/uqx;->z(Z)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 16
    .line 17
    const-string p2, "channelJoined"

    .line 18
    .line 19
    const/4 p3, 0x0

    .line 20
    invoke-static {p1, p2, p3}, Ll/uqx;->s(Ll/uqx;Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 24
    .line 25
    invoke-static {p1}, Ll/uqx;->m(Ll/uqx;)Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object p2, Ll/t54;->f:Ll/t54;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/uqx$a;->a:Ll/uqx;

    .line 35
    .line 36
    invoke-static {p0}, Ll/uqx;->l(Ll/uqx;)Landroid/media/AudioManager;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x3

    .line 41
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setMode(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
