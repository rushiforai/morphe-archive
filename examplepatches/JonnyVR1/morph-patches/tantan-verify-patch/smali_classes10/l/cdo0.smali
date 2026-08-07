.class public Ll/cdo0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public c:I

.field public final d:Ll/usm0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/usm0<",
            "*>;"
        }
    .end annotation
.end field

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/usm0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/usm0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object p1, p0, Ll/cdo0;->e:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/ado0;->L(Ljava/lang/String;)Ll/nsv;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Ll/cdo0;->a:Ll/nsv;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p0, Ll/cdo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/ado0;->K(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, p0, Ll/cdo0;->c:I

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p2, p0, Ll/cdo0;->d:Ll/usm0;

    .line 43
    .line 44
    invoke-static {p1}, Ll/i9o0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iput-object p2, p0, Ll/cdo0;->f:Ljava/lang/String;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->callConnections:Ljava/util/List;

    .line 51
    .line 52
    new-instance p2, Ll/bdo0;

    .line 53
    .line 54
    invoke-direct {p2, p0, v0}, Ll/bdo0;-><init>(Ll/cdo0;Ll/ado0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, p2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;

    .line 62
    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->verticalEffectSvga:Ljava/lang/String;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    const-string p1, ""

    .line 69
    .line 70
    :goto_0
    iput-object p1, p0, Ll/cdo0;->g:Ljava/lang/String;

    .line 71
    .line 72
    return-void
.end method

.method public static synthetic H(Ll/cdo0;Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/cdo0;->I(Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic I(Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cdo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget p0, p0, Ll/cdo0;->c:I

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/ado0;->K(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    sub-int/2addr p0, p1

    .line 38
    const/4 p1, 0x1

    .line 39
    if-ne p0, p1, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p1, 0x0

    .line 43
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/cdo0;->P(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/cdo0;->N(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cdo0;->d:Ll/usm0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/cdo0;->f:Ljava/lang/String;

    .line 13
    .line 14
    iget v2, p0, Ll/cdo0;->c:I

    .line 15
    .line 16
    iget-object v3, p0, Ll/cdo0;->a:Ll/nsv;

    .line 17
    .line 18
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v3, Ll/h64;

    .line 21
    .line 22
    iget-object v3, v3, Ll/h64;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->o0(Ll/usm0;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cdo0;->g:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->r0(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;Ljava/util/List;)V
    .locals 2
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v1, v0, Ll/vkp0;

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    check-cast v0, Ll/vkp0;

    .line 29
    .line 30
    iget-object v0, v0, Ll/vkp0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/cdo0;->L(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/cdo0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/cdo0;->N(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/cdo0;->g:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->r0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0, p1}, Ll/cdo0;->J(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/cdo0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cdo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public final N(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->setCallInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O(Ll/nsv;)Ll/cdo0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)",
            "Ll/cdo0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cdo0;->a:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public final P(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdo0;->a:Ll/nsv;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cdo0;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m0(Ljava/lang/String;Ll/nsv;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->H9:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdo0;->J(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cdo0;->K(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
