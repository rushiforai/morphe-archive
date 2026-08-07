.class public Ll/atm0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/iam;",
        "D:",
        "Ll/oo2;",
        ">",
        "Ll/y8s<",
        "TD;TT;>;"
    }
.end annotation


# instance fields
.field public j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S3(Ll/vak0;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/atm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/atm0;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/atm0;->j4(Ll/vak0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/data/User;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/atm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/atm0;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/atm0;->Y3(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/data/User;ILl/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p2, Ll/atm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Ll/atm0;

    .line 6
    .line 7
    invoke-virtual {p2, p0, p1}, Ll/atm0;->X3(Lcom/p1/mobile/putong/data/User;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic V3(Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p0, Ll/atm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/atm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/atm0;->i4()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic W3(Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p0, Ll/atm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/atm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/atm0;->Z3()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public X3(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/wsm0;

    .line 16
    .line 17
    invoke-direct {v0, p1, p2}, Ll/wsm0;-><init>(Lcom/p1/mobile/putong/data/User;I)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/zsm0;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/zsm0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public Z3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/xsm0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/xsm0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final a4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/atm0;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/vak0;->c:Ll/nsv;

    .line 9
    .line 10
    iput-object p1, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method

.method public final b4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "liveRoom"

    .line 2
    .line 3
    return-object p0
.end method

.method public final d4()Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Ll/vak0;->c:Ll/nsv;

    .line 14
    .line 15
    return-object p0
.end method

.method public e4()Ll/atm0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/atm0<",
            "TT;TD;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/atm0;

    .line 6
    .line 7
    return-object p0
.end method

.method public final f4()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/atm0;->d4()Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/atm0;->d4()Ll/nsv;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    return-object p0
.end method

.method public g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/atm0;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 4
    .line 5
    return-object p0
.end method

.method public h4()Ll/vak0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/atm0;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 4
    .line 5
    return-object p0
.end method

.method public final i0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public i4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/ysm0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/ysm0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public j4(Ll/vak0;)V
    .locals 1
    .param p1    # Ll/vak0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/vsm0;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/vsm0;-><init>(Ll/vak0;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/atm0;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    return-void
.end method
