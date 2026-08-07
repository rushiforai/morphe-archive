.class public Ll/s310;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qwl;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

.field public final b:Lcom/google/gson/Gson;

.field public c:Landroid/content/Context;

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pwl;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Z

.field public h:Ll/pxh0;

.field public i:Z

.field public j:Z

.field public k:I

.field public l:Ll/fyb;

.field public m:Ljava/lang/String;

.field public n:J

.field public final o:Ll/m410;

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/s310;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/s310;->g:Z

    .line 19
    .line 20
    iput v0, p0, Ll/s310;->k:I

    .line 21
    .line 22
    new-instance v0, Ll/fyb;

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {v0, v1, v1, v2}, Ll/fyb;-><init>(IIF)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/s310;->l:Ll/fyb;

    .line 30
    .line 31
    iput-object p1, p0, Ll/s310;->c:Landroid/content/Context;

    .line 32
    .line 33
    new-instance p1, Lcom/google/gson/Gson;

    .line 34
    .line 35
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/s310;->b:Lcom/google/gson/Gson;

    .line 39
    .line 40
    new-instance p1, Ll/m410;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/m410;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/s310;->o:Ll/m410;

    .line 46
    .line 47
    new-instance p1, Ll/s310$a;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Ll/s310$a;-><init>(Ll/s310;)V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/s310;->h:Ll/pxh0;

    .line 53
    .line 54
    return-void
.end method

.method public static synthetic A(Ll/s310;Ll/pwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->U(Ll/pwl;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->release()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/v2t;->c:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "release player LiveEngine\uff1a"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic C(Ll/s310;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s310;->T()V

    return-void
.end method

.method public static synthetic D(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "errorType_videoSizeError_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "_w"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "_h"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v7, 0x0

    .line 39
    move-object v4, p0

    .line 40
    move-object v5, p1

    .line 41
    move-object v6, p2

    .line 42
    invoke-static/range {v2 .. v7}, Ll/fgt;->a(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string p1, "ctyp="

    .line 48
    .line 49
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p1, ",w="

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, ",h="

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p1, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p2, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 80
    .line 81
    iget-object p4, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 82
    .line 83
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 84
    .line 85
    const-string p5, "videoSizeError"

    .line 86
    .line 87
    invoke-static {p1, p2, p4, p5, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->c7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    move-object v6, p2

    .line 100
    :goto_0
    sget-object p0, Ll/v2t;->c:Ljava/lang/String;

    .line 101
    .line 102
    new-instance p1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string p2, "liveId"

    .line 105
    .line 106
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p2, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string p2, "StreamCheckError:"

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p2, " detail:"

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public static bridge synthetic E(Ll/s310;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s310;->f:Z

    return p0
.end method

.method public static bridge synthetic F(Ll/s310;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->e:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic G(Ll/s310;)Ll/m410;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    return-object p0
.end method

.method public static bridge synthetic H(Ll/s310;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->N(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    return-void
.end method

.method public static bridge synthetic I(Ll/s310;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->O(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    return-void
.end method

.method public static bridge synthetic J(Ll/s310;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->d0(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic K(Ll/s310;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->g0(I)V

    return-void
.end method

.method public static synthetic m(Ll/s310;Ll/pwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->b0(Ll/pwl;)V

    return-void
.end method

.method public static synthetic n(Ll/s310;Ll/pwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->X(Ll/pwl;)V

    return-void
.end method

.method public static synthetic o(Ll/s310;Ll/pwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->R(Ll/pwl;)V

    return-void
.end method

.method public static synthetic p(Ll/s310;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->c0(I)V

    return-void
.end method

.method public static synthetic q(Ll/s310;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->Y(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic r(Ljava/util/ArrayList;Ll/pwl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/pwl;->s1(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ll/s310;)Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s310;->a0()Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t(Ll/s310;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->S(I)V

    return-void
.end method

.method public static synthetic u(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Ll/s310;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s310;->V()V

    return-void
.end method

.method public static synthetic w(ILl/pwl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/pwl;->l0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/s310;)Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s310;->Z()Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 4
    .line 5
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic z(Ll/s310;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s310;->W(Ljava/util/Map$Entry;)V

    return-void
.end method


# virtual methods
.method public final L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/cgu;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/cgu;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/vwt;->O4()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Ll/cgu;->a:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p3, v0, Ll/cgu;->e:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p2, v0, Ll/cgu;->d:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, v0, Ll/cgu;->c:Ljava/lang/String;

    .line 26
    .line 27
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/xau;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, v0, Ll/cgu;->b:Ljava/lang/String;

    .line 38
    .line 39
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/wrv;->p()Ll/vwt;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/vwt;->e5()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, v0, Ll/cgu;->f:Ljava/lang/String;

    .line 50
    .line 51
    new-instance p1, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 52
    .line 53
    iget-object p2, p0, Ll/s310;->c:Landroid/content/Context;

    .line 54
    .line 55
    sget-object p3, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$PlayerType;->NEW_MOMO:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$PlayerType;

    .line 56
    .line 57
    invoke-direct {p1, p2, v0, p3}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;-><init>(Landroid/content/Context;Ll/cgu;Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$PlayerType;)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 61
    .line 62
    return-void
.end method

.method public M()Ll/fyb;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->l:Ll/fyb;

    .line 2
    .line 3
    return-object p0
.end method

.method public final N(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s310;->b:Lcom/google/gson/Gson;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 12
    .line 13
    iget v2, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 14
    .line 15
    iget-object v1, p0, Ll/s310;->l:Ll/fyb;

    .line 16
    .line 17
    iget v3, v1, Ll/fyb;->a:I

    .line 18
    .line 19
    if-eq v2, v3, :cond_1

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    :goto_0
    move v6, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->mode:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :goto_1
    new-instance v1, Ll/fyb;

    .line 30
    .line 31
    iget-wide v4, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ts:J

    .line 32
    .line 33
    invoke-direct/range {v1 .. v6}, Ll/fyb;-><init>(IIJI)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/s310;->l:Ll/fyb;

    .line 37
    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v0, "in player new ctyp = "

    .line 41
    .line 42
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/s310;->l:Ll/fyb;

    .line 46
    .line 47
    iget v0, v0, Ll/fyb;->a:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v0, "LivePkConstant"

    .line 57
    .line 58
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Ll/x210;

    .line 62
    .line 63
    invoke-direct {p1, p0, v2}, Ll/x210;-><init>(Ll/s310;I)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public final O(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s310;->b:Lcom/google/gson/Gson;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v1, p0, Ll/s310;->p:I

    .line 16
    .line 17
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->mode:I

    .line 18
    .line 19
    if-eq v1, v2, :cond_0

    .line 20
    .line 21
    iput v2, p0, Ll/s310;->p:I

    .line 22
    .line 23
    new-instance v1, Ll/i310;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/i310;-><init>(Ll/s310;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 34
    .line 35
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 39
    .line 40
    new-instance v2, Ll/j310;

    .line 41
    .line 42
    invoke-direct {v2, v1}, Ll/j310;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-lez p1, :cond_1

    .line 55
    .line 56
    move-object v0, v1

    .line 57
    :cond_1
    if-nez v0, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/k310;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/k310;-><init>(Ll/s310;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    iget-wide v2, p0, Ll/s310;->n:J

    .line 79
    .line 80
    sub-long/2addr v0, v2

    .line 81
    const-wide/16 v2, 0x3e8

    .line 82
    .line 83
    cmp-long p1, v0, v2

    .line 84
    .line 85
    if-lez p1, :cond_3

    .line 86
    .line 87
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    iput-wide v0, p0, Ll/s310;->n:J

    .line 92
    .line 93
    new-instance p1, Ll/l310;

    .line 94
    .line 95
    invoke-direct {p1, p0}, Ll/l310;-><init>(Ll/s310;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    return-void
.end method

.method public P(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Ll/v210;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/v210;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/w210;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/w210;-><init>(Ll/s310;Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s310;->c:Landroid/content/Context;

    .line 4
    .line 5
    new-instance v2, Ll/u210;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/u210;-><init>(Ll/s310;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/m410;->n(Landroid/content/Context;Ll/pcj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic R(Ll/pwl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->l:Ll/fyb;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/pwl;->c0(Ll/fyb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic S(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/m410;->t(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/s310;->o:Ll/m410;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Ll/m410;->x(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/s310;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/s310;->e:Ljava/util/List;

    .line 21
    .line 22
    new-instance v0, Ll/a310;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/a310;-><init>(Ll/s310;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic T()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/z210;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/z210;-><init>(Ll/s310;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ll/s310;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic U(Ll/pwl;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/s310;->p:I

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/pwl;->p1(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/y210;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/y210;-><init>(Ll/s310;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic W(Ljava/util/Map$Entry;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s310;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic X(Ll/pwl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/pwl;->O0(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/s310;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/c310;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/c310;-><init>(Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic Z()Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Ltv/danmaku/ijk/media/player/PullWatchInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a()Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic a0()Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "live player stop. hasStartPlay:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/s310;->j:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " hasStartPlayCount:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/s310;->k:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", MomoLivePlayerNewVersionImpl hashCode:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/s310;->d0(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Ll/s310;->m:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    iput-boolean v1, p0, Ll/s310;->f:Z

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Ll/s310;->o:Ll/m410;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/m410;->m()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 59
    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->d(Landroid/view/Surface;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object p1, p0, Ll/s310;->o:Ll/m410;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/m410;->i()V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-boolean v2, p0, Ll/s310;->j:Z

    .line 76
    .line 77
    if-eqz v2, :cond_3

    .line 78
    .line 79
    iget v2, p0, Ll/s310;->k:I

    .line 80
    .line 81
    sub-int/2addr v2, v1

    .line 82
    iput v2, p0, Ll/s310;->k:I

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->e(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->c(Ll/pxh0;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 93
    .line 94
    new-instance v1, Ll/d310;

    .line 95
    .line 96
    invoke-direct {v1, p1}, Ll/d310;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 103
    .line 104
    :cond_3
    const/4 p1, 0x0

    .line 105
    iput-boolean p1, p0, Ll/s310;->j:Z

    .line 106
    .line 107
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/m410;->k()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final synthetic b0(Ll/pwl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->l:Ll/fyb;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/pwl;->c0(Ll/fyb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/pwl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c0(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ll/s310;->b(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 14
    .line 15
    new-instance v2, Ll/b310;

    .line 16
    .line 17
    invoke-direct {v2, p1}, Ll/b310;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iput-boolean v1, p0, Ll/s310;->g:Z

    .line 24
    .line 25
    return-void
.end method

.method public d(Landroid/widget/FrameLayout;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s310;->c:Landroid/content/Context;

    .line 4
    .line 5
    new-instance v2, Ll/g310;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/g310;-><init>(Ll/s310;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, p1, v2}, Ll/m410;->q(Landroid/content/Context;Landroid/view/ViewGroup;Ll/pcj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final d0(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/v2t;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xau;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s310;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public e0()V
    .locals 3

    .line 1
    new-instance v0, Ll/fyb;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v1, v2}, Ll/fyb;-><init>(IIF)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/s310;->l:Ll/fyb;

    .line 9
    .line 10
    return-void
.end method

.method public f(Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m410;->v(Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f0(Ll/fyb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s310;->l:Ll/fyb;

    .line 2
    .line 3
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m410;->u(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g0(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/s310;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/s310;->g:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/s310;->c:Landroid/content/Context;

    .line 9
    .line 10
    new-instance v1, Ll/f310;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/f310;-><init>(Ll/s310;I)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p0, 0x1388

    .line 16
    .line 17
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public h(Ll/pwl;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s310;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/s310;->m:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ll/s310;->f:Z

    .line 5
    .line 6
    invoke-virtual {p0, p3, p4, p5}, Ll/s310;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/s310;->Q()V

    .line 10
    .line 11
    .line 12
    new-instance p3, Ll/fyb;

    .line 13
    .line 14
    const/4 p4, -0x1

    .line 15
    const/4 p5, 0x0

    .line 16
    invoke-direct {p3, p4, p4, p5}, Ll/fyb;-><init>(IIF)V

    .line 17
    .line 18
    .line 19
    iput-object p3, p0, Ll/s310;->l:Ll/fyb;

    .line 20
    .line 21
    iget-object p3, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 22
    .line 23
    iget-object p4, p0, Ll/s310;->h:Ll/pxh0;

    .line 24
    .line 25
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->c(Ll/pxh0;)V

    .line 26
    .line 27
    .line 28
    iget-object p3, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 29
    .line 30
    invoke-virtual {p3, p1, p2}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p3, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 34
    .line 35
    iget-boolean p4, p0, Ll/s310;->i:Z

    .line 36
    .line 37
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->setMute(Z)V

    .line 38
    .line 39
    .line 40
    const/4 p3, 0x1

    .line 41
    iput-boolean p3, p0, Ll/s310;->j:Z

    .line 42
    .line 43
    iget p4, p0, Ll/s310;->k:I

    .line 44
    .line 45
    add-int/2addr p4, p3

    .line 46
    iput p4, p0, Ll/s310;->k:I

    .line 47
    .line 48
    new-instance p3, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p4, "start player:"

    .line 51
    .line 52
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p1, " ipv6: "

    .line 59
    .line 60
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ",LiveEngine hashCode:"

    .line 67
    .line 68
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Ll/s310;->d0(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public k()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m410;->l()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    .line 2
    .line 3
    new-instance v0, Ll/e310;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p3}, Ll/e310;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/m410;->w(Ll/b30;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "reset\uff0cMomoLivePlayerNewVersionImpl hashCode:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/s310;->d0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/s310;->i:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/s310;->f:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Ll/s310;->g:Z

    .line 28
    .line 29
    new-instance v0, Ll/fyb;

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-direct {v0, v1, v1, v2}, Ll/fyb;-><init>(IIF)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/s310;->l:Ll/fyb;

    .line 37
    .line 38
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 47
    .line 48
    new-instance v1, Ll/h310;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/h310;-><init>(Ll/s310;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object v0, p0, Ll/s310;->e:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/s310;->o:Ll/m410;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/m410;->r()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setMute(Z)V
    .locals 3

    .line 1
    sget-object v0, Ll/v2t;->c:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setMute:old:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Ll/s310;->i:Z

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " setMute:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, ",MomoLivePlayerNewVersionImpl hashCode:"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iput-boolean p1, p0, Ll/s310;->i:Z

    .line 43
    .line 44
    iget-object p0, p0, Ll/s310;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->setMute(Z)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
