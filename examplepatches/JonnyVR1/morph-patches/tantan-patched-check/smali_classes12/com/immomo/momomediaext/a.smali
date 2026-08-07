.class public Lcom/immomo/momomediaext/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private A:Ll/hnw;

.field private B:I

.field private C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private D:Z

.field private E:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

.field private F:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

.field private G:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

.field private H:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

.field private I:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field private a:Ll/hwl;

.field private b:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field private c:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

.field private d:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

.field private e:Lcom/momo/pub/MomoPipelineModuleRegister;

.field private f:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private g:Ll/ebl0;

.field private h:Ll/gbl0;

.field private i:Ll/gkl0;

.field private j:Ll/kod0;

.field private k:Ll/fb1;

.field private l:Z

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Ll/usl;

.field private q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

.field private r:I

.field private s:I

.field private t:Ljava/lang/String;

.field private u:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveRoomMode;

.field private v:Z

.field private w:J

.field private x:Z

.field private y:Ll/wpw;

.field private z:I


# direct methods
.method public constructor <init>(Lcom/momo/pub/MomoPipelineModuleRegister;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/a;->b:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->l:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->m:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->n:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->o:Z

    .line 17
    .line 18
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 19
    .line 20
    const-string v7, "100"

    .line 21
    .line 22
    const/4 v8, 0x1

    .line 23
    const-string v2, "0"

    .line 24
    .line 25
    const-string v3, "0"

    .line 26
    .line 27
    const-string v4, "0"

    .line 28
    .line 29
    const-string v5, "0"

    .line 30
    .line 31
    const-string v6, "0"

    .line 32
    .line 33
    invoke-direct/range {v1 .. v8}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 37
    .line 38
    iput v0, p0, Lcom/immomo/momomediaext/a;->r:I

    .line 39
    .line 40
    iput v0, p0, Lcom/immomo/momomediaext/a;->s:I

    .line 41
    .line 42
    const-string v1, ""

    .line 43
    .line 44
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->t:Ljava/lang/String;

    .line 45
    .line 46
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveRoomMode;->MMLIVEROOMMODELIVE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveRoomMode;

    .line 47
    .line 48
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->u:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveRoomMode;

    .line 49
    .line 50
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->v:Z

    .line 51
    .line 52
    const-wide/16 v1, -0x1

    .line 53
    .line 54
    iput-wide v1, p0, Lcom/immomo/momomediaext/a;->w:J

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->x:Z

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->y:Ll/wpw;

    .line 60
    .line 61
    const/4 v2, -0x2

    .line 62
    iput v2, p0, Lcom/immomo/momomediaext/a;->z:I

    .line 63
    .line 64
    const/4 v2, -0x1

    .line 65
    iput v2, p0, Lcom/immomo/momomediaext/a;->B:I

    .line 66
    .line 67
    new-instance v2, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v2, p0, Lcom/immomo/momomediaext/a;->C:Ljava/util/List;

    .line 73
    .line 74
    iput-boolean v0, p0, Lcom/immomo/momomediaext/a;->D:Z

    .line 75
    .line 76
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->E:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 77
    .line 78
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->F:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 79
    .line 80
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->G:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 81
    .line 82
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->H:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 83
    .line 84
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->I:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 85
    .line 86
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 87
    .line 88
    iput-object p3, p0, Lcom/immomo/momomediaext/a;->b:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 89
    .line 90
    if-eqz p2, :cond_0

    .line 91
    .line 92
    iput-object p2, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    new-instance v3, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 96
    .line 97
    const-string v9, "100"

    .line 98
    .line 99
    const/4 v10, 0x1

    .line 100
    const-string v4, "0"

    .line 101
    .line 102
    const-string v5, "0"

    .line 103
    .line 104
    const-string v6, "0"

    .line 105
    .line 106
    const-string v7, "0"

    .line 107
    .line 108
    const-string v8, "0"

    .line 109
    .line 110
    invoke-direct/range {v3 .. v10}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 111
    .line 112
    .line 113
    iput-object v3, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 114
    .line 115
    return-void
.end method

.method private Q(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 22
    .line 23
    invoke-interface {v1, v0}, Ll/hwl;->v(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public A(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->e0(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public B(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    sget-object v0, Lcom/immomo/momomediaext/a$a;->b:[I

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    aget p1, v0, p1

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eq p1, v2, :cond_1

    .line 17
    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    move v0, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v2

    .line 23
    :cond_1
    :goto_0
    if-lez v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ll/hwl;->E0(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_2
    return v1
.end method

.method public C(ILl/hnw;)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/a;->z:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/a;->A:Ll/hnw;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/hwl;->W0(ILl/hnw;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/a;->m:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->u1(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public E(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->setEnableSpeakerphone(Z)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public F(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/a;->l:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/hwl;->C0(Z)V

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/immomo/momomediaext/a;->l:Z

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-interface {p0, p1}, Ll/c4m;->t1(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p1, 0x2

    .line 22
    invoke-interface {p0, p1}, Ll/c4m;->t1(I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public G(Ll/fpf0;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x1388

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->i(IILl/fpf0;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public H(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 16
    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    iput v1, v0, Ll/tow;->l:I

    .line 22
    .line 23
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 24
    .line 25
    iput v1, v0, Ll/tow;->k:I

    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0, p1}, Ll/c4m;->J(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/a;->o:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->G(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->I1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/a;->n:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c4m;->B1(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public L(F)V
    .locals 3

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "setMasterAudioVolume"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/l6m;->g0(F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public M(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "setMusicVolumeRTC:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ll/hwl;->K0(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public N(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/momomediaext/a;->w:J

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/c4m;->O(J)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public O(Ll/fb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->k:Ll/fb1;

    .line 2
    .line 3
    return-void
.end method

.method public P(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/hwl;->v(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->C:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public R(IZ)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    int-to-long v0, p1

    .line 6
    invoke-interface {p0, v0, v1, p2}, Ll/c4m;->Q0(JZ)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public S(I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/a;->B:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->i2(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method

.method public T(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->e(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/a;->x:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->q1(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public V(Ll/kod0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->j:Ll/kod0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->j2(Ll/kod0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public W(Lcom/immomo/mediacore/coninf/MRtcEventHandler;Ll/ebl0;Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->f:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/a;->g:Ll/ebl0;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/momomediaext/a;->i:Ll/gkl0;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/hwl;->X1(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public X(Ll/gbl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->h:Ll/gbl0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->P0(Ll/gbl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->t:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->B(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Z(Ljava/lang/String;ZI)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, p1, p2, v0, p3}, Ll/hwl;->r0(Ljava/lang/String;ZZI)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/hwl;->h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x2

    .line 11
    return p0
.end method

.method public a0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->stopSurroundMusic()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->I:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x64

    .line 8
    .line 9
    invoke-interface {p0, p1, v0, v0}, Ll/c4m;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public b0(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->x1(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x2

    .line 11
    return p0
.end method

.method public c(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->E:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->i0(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public c0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->l2(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Ll/wpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->y:Ll/wpw;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->H0(Ll/wpw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->H:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->E(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public f(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->F:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->U(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public g(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->G:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->Y1(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public h(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->I:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 6
    .line 7
    invoke-interface {v0, p0, p1, p2, p3}, Ll/c4m;->c2(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;III)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public i(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 14
    .line 15
    invoke-interface {p0, p1, p2}, Ll/hwl;->W(ZLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/a;->D:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->l1(Z)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public k(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/c4m;->u(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/hwl;->T1(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->v0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    .locals 7
    .param p1    # Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "enterRoom"

    .line 2
    .line 3
    const-string v1, "userid:"

    .line 4
    .line 5
    iput-object p1, p0, Lcom/immomo/momomediaext/a;->c:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/immomo/momomediaext/a;->d:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 10
    .line 11
    invoke-interface {v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 16
    .line 17
    iput v3, v2, Ll/tow;->m:I

    .line 18
    .line 19
    iput v3, v2, Ll/tow;->s:I

    .line 20
    .line 21
    iput v3, v2, Ll/tow;->k:I

    .line 22
    .line 23
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 24
    .line 25
    iput v3, v2, Ll/tow;->n:I

    .line 26
    .line 27
    iput v3, v2, Ll/tow;->t:I

    .line 28
    .line 29
    iput v3, v2, Ll/tow;->l:I

    .line 30
    .line 31
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 32
    .line 33
    iput v3, v2, Ll/tow;->F:I

    .line 34
    .line 35
    iput v3, v2, Ll/uow;->S0:I

    .line 36
    .line 37
    iget-object v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v3, v2, Ll/uow;->v0:Ljava/lang/String;

    .line 40
    .line 41
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 42
    .line 43
    iput v3, v2, Ll/tow;->H:I

    .line 44
    .line 45
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 46
    .line 47
    iput v3, v2, Ll/tow;->R:I

    .line 48
    .line 49
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 50
    .line 51
    iput v3, v2, Ll/tow;->P:I

    .line 52
    .line 53
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 54
    .line 55
    iput v3, v2, Ll/tow;->S:I

    .line 56
    .line 57
    iget-object v3, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userSig:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v3, v2, Ll/uow;->C0:Ljava/lang/String;

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    iput-boolean v3, v2, Ll/uow;->G0:Z

    .line 63
    .line 64
    iget v4, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->blueToothType:I

    .line 65
    .line 66
    iput v4, v2, Ll/uow;->b1:I

    .line 67
    .line 68
    iget v4, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->degradationPrefer:I

    .line 69
    .line 70
    iput v4, v2, Ll/uow;->a1:I

    .line 71
    .line 72
    :try_start_0
    iget-object v4, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-nez v5, :cond_1

    .line 79
    .line 80
    iget-object v5, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    if-nez v5, :cond_1

    .line 87
    .line 88
    iget-object v5, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_0

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    iget-object v1, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 100
    .line 101
    .line 102
    move-result-wide v4

    .line 103
    long-to-int v1, v4

    .line 104
    iput v1, v2, Ll/ror;->i1:I

    .line 105
    .line 106
    iput v1, v2, Ll/uow;->B0:I

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :catch_0
    move-exception v1

    .line 110
    goto :goto_1

    .line 111
    :cond_1
    :goto_0
    iget-object v5, p0, Lcom/immomo/momomediaext/a;->f:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 112
    .line 113
    if-eqz v5, :cond_2

    .line 114
    .line 115
    const/16 v6, 0x328

    .line 116
    .line 117
    invoke-interface {v5, v6}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onError(I)V

    .line 118
    .line 119
    .line 120
    :cond_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    new-instance v6, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v1, ",channel:"

    .line 133
    .line 134
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object v1, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v1, ",appid:"

    .line 143
    .line 144
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    iget-object v1, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    sget-object v4, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 157
    .line 158
    invoke-virtual {v5, v0, v1, v4}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .line 160
    .line 161
    const/4 p0, -0x3

    .line 162
    return p0

    .line 163
    :goto_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    const-string v5, "userid"

    .line 168
    .line 169
    iget-object v6, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v4, v0, v5, v6}, Ll/b7y;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 175
    .line 176
    .line 177
    :goto_2
    if-eqz p3, :cond_3

    .line 178
    .line 179
    iget v0, p3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 180
    .line 181
    if-lez v0, :cond_3

    .line 182
    .line 183
    iget v1, p3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 184
    .line 185
    if-lez v1, :cond_3

    .line 186
    .line 187
    iput v0, v2, Ll/tow;->k:I

    .line 188
    .line 189
    iput v1, v2, Ll/tow;->l:I

    .line 190
    .line 191
    :cond_3
    iget-object v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 192
    .line 193
    iput-object v0, v2, Ll/ror;->g1:Ljava/lang/String;

    .line 194
    .line 195
    iget-object v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->role:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 196
    .line 197
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleAudience:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 198
    .line 199
    const/4 v4, 0x2

    .line 200
    if-ne v0, v1, :cond_4

    .line 201
    .line 202
    move v0, v4

    .line 203
    goto :goto_3

    .line 204
    :cond_4
    move v0, v3

    .line 205
    :goto_3
    iput v0, v2, Ll/ror;->e1:I

    .line 206
    .line 207
    iget-boolean v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->isHost:Z

    .line 208
    .line 209
    iput-boolean v0, v2, Ll/ror;->h1:Z

    .line 210
    .line 211
    iget v0, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 212
    .line 213
    iput v0, v2, Ll/ror;->l1:I

    .line 214
    .line 215
    iget-object v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->sourceLanguage:Ljava/lang/String;

    .line 216
    .line 217
    iput-object v0, v2, Ll/ror;->n1:Ljava/lang/String;

    .line 218
    .line 219
    iget v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->agoraRtcKeepAlive:I

    .line 220
    .line 221
    iput v0, v2, Ll/uow;->c1:I

    .line 222
    .line 223
    iget v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->volcRtcKeepAlive:I

    .line 224
    .line 225
    iput v0, v2, Ll/uow;->d1:I

    .line 226
    .line 227
    iget-boolean v0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableRtcPlaybackCallback:Z

    .line 228
    .line 229
    iput-boolean v0, v2, Ll/ror;->o1:Z

    .line 230
    .line 231
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 232
    .line 233
    invoke-interface {v0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 234
    .line 235
    .line 236
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 237
    .line 238
    sget-object v1, Lcom/immomo/momomediaext/a$a;->c:[I

    .line 239
    .line 240
    iget-object v5, p0, Lcom/immomo/momomediaext/a;->b:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 241
    .line 242
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 243
    .line 244
    .line 245
    move-result v5

    .line 246
    aget v1, v1, v5

    .line 247
    .line 248
    packed-switch v1, :pswitch_data_0

    .line 249
    .line 250
    .line 251
    goto :goto_4

    .line 252
    :pswitch_0
    const/4 p0, -0x2

    .line 253
    return p0

    .line 254
    :pswitch_1
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->VOLCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :pswitch_2
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 258
    .line 259
    goto :goto_4

    .line 260
    :pswitch_3
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->TXLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :pswitch_4
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 264
    .line 265
    :goto_4
    :pswitch_5
    iget-object v1, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v5, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 268
    .line 269
    invoke-interface {v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->L()Ll/usl;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    iput-object v5, p0, Lcom/immomo/momomediaext/a;->p:Ll/usl;

    .line 274
    .line 275
    new-instance v5, Ll/brx;

    .line 276
    .line 277
    invoke-direct {v5}, Ll/brx;-><init>()V

    .line 278
    .line 279
    .line 280
    iget-object v6, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 281
    .line 282
    invoke-virtual {v6}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    invoke-virtual {v5, v6}, Ll/brx;->o(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget-object v6, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 290
    .line 291
    invoke-virtual {v6}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v6

    .line 295
    invoke-virtual {v5, v6}, Ll/brx;->u(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    iget-object v6, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 299
    .line 300
    invoke-virtual {v6}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v6

    .line 304
    invoke-virtual {v5, v6}, Ll/brx;->s(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    iget v6, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 308
    .line 309
    invoke-virtual {v5, v6}, Ll/brx;->r(I)V

    .line 310
    .line 311
    .line 312
    iget-object v6, p0, Lcom/immomo/momomediaext/a;->q:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 313
    .line 314
    invoke-virtual {v6}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getSecret()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v6

    .line 318
    invoke-virtual {v5, v6}, Ll/brx;->t(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget v6, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 322
    .line 323
    invoke-virtual {v5, v6}, Ll/brx;->p(I)V

    .line 324
    .line 325
    .line 326
    iget-object v6, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 327
    .line 328
    invoke-interface {v6, v0, v1, v5}, Lcom/momo/pub/MomoPipelineModuleRegister;->M(Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;Ljava/lang/String;Ll/brx;)Ll/hwl;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    iput-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 333
    .line 334
    if-eqz v1, :cond_d

    .line 335
    .line 336
    iget v5, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 337
    .line 338
    invoke-interface {v1, v5}, Ll/c4m;->f2(I)V

    .line 339
    .line 340
    .line 341
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 342
    .line 343
    iget-object v5, p0, Lcom/immomo/momomediaext/a;->d:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 344
    .line 345
    iget-object v5, v5, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channelKey:Ljava/lang/String;

    .line 346
    .line 347
    invoke-interface {v1, v5}, Ll/hwl;->h0(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 351
    .line 352
    invoke-interface {v1, v2}, Ll/c4m;->S0(Ll/uow;)V

    .line 353
    .line 354
    .line 355
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 356
    .line 357
    iget-boolean v5, p0, Lcom/immomo/momomediaext/a;->n:Z

    .line 358
    .line 359
    invoke-interface {v1, v5}, Ll/c4m;->B1(Z)V

    .line 360
    .line 361
    .line 362
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 363
    .line 364
    iget-boolean v5, p0, Lcom/immomo/momomediaext/a;->o:Z

    .line 365
    .line 366
    invoke-interface {v1, v5}, Ll/hwl;->G(Z)V

    .line 367
    .line 368
    .line 369
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 370
    .line 371
    iget-boolean v5, p0, Lcom/immomo/momomediaext/a;->l:Z

    .line 372
    .line 373
    invoke-interface {v1, v5}, Ll/hwl;->C0(Z)V

    .line 374
    .line 375
    .line 376
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 377
    .line 378
    iget-boolean v5, p0, Lcom/immomo/momomediaext/a;->m:Z

    .line 379
    .line 380
    invoke-interface {v1, v5}, Ll/hwl;->u1(Z)V

    .line 381
    .line 382
    .line 383
    iget-boolean v1, p0, Lcom/immomo/momomediaext/a;->l:Z

    .line 384
    .line 385
    iget-object v5, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 386
    .line 387
    if-eqz v1, :cond_5

    .line 388
    .line 389
    invoke-interface {v5, v3}, Ll/c4m;->t1(I)V

    .line 390
    .line 391
    .line 392
    goto :goto_5

    .line 393
    :cond_5
    invoke-interface {v5, v4}, Ll/c4m;->t1(I)V

    .line 394
    .line 395
    .line 396
    :goto_5
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 397
    .line 398
    iget v4, v2, Ll/ror;->e1:I

    .line 399
    .line 400
    invoke-interface {v1, v4}, Ll/hwl;->D(I)V

    .line 401
    .line 402
    .line 403
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 404
    .line 405
    iget p1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 406
    .line 407
    invoke-interface {v1, p1}, Ll/c4m;->T0(I)V

    .line 408
    .line 409
    .line 410
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 411
    .line 412
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->f:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 413
    .line 414
    invoke-interface {p1, v1}, Ll/hwl;->X1(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 415
    .line 416
    .line 417
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 418
    .line 419
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->g:Ll/ebl0;

    .line 420
    .line 421
    invoke-interface {p1, v1}, Ll/hwl;->m0(Ll/ebl0;)V

    .line 422
    .line 423
    .line 424
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 425
    .line 426
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->i:Ll/gkl0;

    .line 427
    .line 428
    invoke-interface {p1, v1}, Ll/hwl;->r1(Ll/gkl0;)V

    .line 429
    .line 430
    .line 431
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 432
    .line 433
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->h:Ll/gbl0;

    .line 434
    .line 435
    invoke-interface {p1, v1}, Ll/hwl;->P0(Ll/gbl0;)V

    .line 436
    .line 437
    .line 438
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 439
    .line 440
    iget-object v1, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioProfile:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 441
    .line 442
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->value()I

    .line 443
    .line 444
    .line 445
    move-result v1

    .line 446
    iget-object v4, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioScenario:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 447
    .line 448
    invoke-virtual {v4}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->value()I

    .line 449
    .line 450
    .line 451
    move-result v4

    .line 452
    invoke-interface {p1, v1, v4}, Ll/hwl;->M0(II)V

    .line 453
    .line 454
    .line 455
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 456
    .line 457
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->j:Ll/kod0;

    .line 458
    .line 459
    invoke-interface {p1, v1}, Ll/hwl;->j2(Ll/kod0;)V

    .line 460
    .line 461
    .line 462
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 463
    .line 464
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->k:Ll/fb1;

    .line 465
    .line 466
    invoke-interface {p1, v1}, Ll/l6m;->R(Ll/fb1;)V

    .line 467
    .line 468
    .line 469
    if-eqz p3, :cond_9

    .line 470
    .line 471
    iget p1, p3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoBitrate:I

    .line 472
    .line 473
    if-lez p1, :cond_9

    .line 474
    .line 475
    iget v1, p3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoFps:I

    .line 476
    .line 477
    if-lez v1, :cond_9

    .line 478
    .line 479
    if-lez p1, :cond_6

    .line 480
    .line 481
    iget-object v4, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 482
    .line 483
    iget v5, v2, Ll/tow;->k:I

    .line 484
    .line 485
    iget v2, v2, Ll/tow;->l:I

    .line 486
    .line 487
    invoke-interface {v4, p1, v1, v5, v2}, Ll/hwl;->K(IIII)V

    .line 488
    .line 489
    .line 490
    :cond_6
    iget-object p1, p3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 491
    .line 492
    if-eqz p1, :cond_7

    .line 493
    .line 494
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    if-gtz p1, :cond_8

    .line 499
    .line 500
    :cond_7
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->d:Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 501
    .line 502
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 503
    .line 504
    iput-object p1, p3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 505
    .line 506
    :cond_8
    invoke-virtual {p0, p3}, Lcom/immomo/momomediaext/a;->H(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 507
    .line 508
    .line 509
    :cond_9
    sget-object p1, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 510
    .line 511
    if-ne v0, p1, :cond_a

    .line 512
    .line 513
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 514
    .line 515
    invoke-interface {p1, v3}, Ll/hwl;->Z0(Z)V

    .line 516
    .line 517
    .line 518
    :cond_a
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 519
    .line 520
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->E:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 521
    .line 522
    invoke-interface {p1, p3}, Ll/hwl;->i0(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 523
    .line 524
    .line 525
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 526
    .line 527
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->F:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 528
    .line 529
    invoke-interface {p1, p3}, Ll/hwl;->U(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V

    .line 530
    .line 531
    .line 532
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 533
    .line 534
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->G:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 535
    .line 536
    invoke-interface {p1, p3}, Ll/hwl;->Y1(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V

    .line 537
    .line 538
    .line 539
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 540
    .line 541
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->H:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 542
    .line 543
    invoke-interface {p1, p3}, Ll/hwl;->E(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V

    .line 544
    .line 545
    .line 546
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 547
    .line 548
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->y:Ll/wpw;

    .line 549
    .line 550
    invoke-interface {p1, p3}, Ll/hwl;->H0(Ll/wpw;)V

    .line 551
    .line 552
    .line 553
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 554
    .line 555
    invoke-interface {p1, v3}, Ll/hwl;->X(Z)V

    .line 556
    .line 557
    .line 558
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 559
    .line 560
    iget-boolean p3, p0, Lcom/immomo/momomediaext/a;->v:Z

    .line 561
    .line 562
    invoke-interface {p1, p3}, Ll/c4m;->m(Z)V

    .line 563
    .line 564
    .line 565
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 566
    .line 567
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->t:Ljava/lang/String;

    .line 568
    .line 569
    invoke-interface {p1, p3}, Ll/hwl;->B(Ljava/lang/String;)V

    .line 570
    .line 571
    .line 572
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 573
    .line 574
    iget-boolean p3, p0, Lcom/immomo/momomediaext/a;->x:Z

    .line 575
    .line 576
    invoke-interface {p1, p3}, Ll/hwl;->q1(Z)V

    .line 577
    .line 578
    .line 579
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 580
    .line 581
    iget-boolean p2, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableConferenceReconnect:Z

    .line 582
    .line 583
    invoke-interface {p1, p2}, Ll/hwl;->o1(Z)V

    .line 584
    .line 585
    .line 586
    iget-wide p1, p0, Lcom/immomo/momomediaext/a;->w:J

    .line 587
    .line 588
    const-wide/16 v0, 0x0

    .line 589
    .line 590
    cmp-long p3, p1, v0

    .line 591
    .line 592
    if-ltz p3, :cond_b

    .line 593
    .line 594
    iget-object p3, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 595
    .line 596
    invoke-interface {p3, p1, p2}, Ll/c4m;->O(J)V

    .line 597
    .line 598
    .line 599
    :cond_b
    iget-object p1, p0, Lcom/immomo/momomediaext/a;->C:Ljava/util/List;

    .line 600
    .line 601
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/a;->Q(Ljava/util/List;)V

    .line 602
    .line 603
    .line 604
    iget-boolean p1, p0, Lcom/immomo/momomediaext/a;->D:Z

    .line 605
    .line 606
    if-eqz p1, :cond_c

    .line 607
    .line 608
    iget-object p2, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 609
    .line 610
    invoke-interface {p2, p1}, Ll/hwl;->l1(Z)I

    .line 611
    .line 612
    .line 613
    :cond_c
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 614
    .line 615
    invoke-interface {p0}, Ll/c4m;->t0()I

    .line 616
    .line 617
    .line 618
    move-result p0

    .line 619
    goto :goto_6

    .line 620
    :cond_d
    const/4 p0, -0x4

    .line 621
    :goto_6
    return p0

    .line 622
    nop

    .line 623
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public n()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->k()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public o()Ll/mob0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->g()Ll/mob0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public p()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->c()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public q()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->r()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->p:Ll/usl;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/momomediaext/a;->e:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 10
    .line 11
    invoke-interface {v1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/immomo/momomediaext/a;->p:Ll/usl;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/c4m;->f()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t(ILjava/lang/String;IDDZ)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v9, 0x0

    .line 6
    .line 7
    move v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v3, p3

    .line 10
    move-wide v4, p4

    .line 11
    move-wide/from16 v6, p6

    .line 12
    .line 13
    move/from16 v8, p8

    .line 14
    .line 15
    invoke-interface/range {v0 .. v10}, Ll/hwl;->K1(ILjava/lang/String;IDDZD)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->selectAudioTrack(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public w([B)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/hwl;->L0([B)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return v0
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->x(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->f1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/a;->a:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->h(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method
