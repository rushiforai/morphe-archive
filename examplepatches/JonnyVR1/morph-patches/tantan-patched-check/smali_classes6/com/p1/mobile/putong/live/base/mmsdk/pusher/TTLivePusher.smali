.class public Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v6m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;,
        Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;
    }
.end annotation


# instance fields
.field public a:Ll/v6m;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$a;->a:[I

    .line 11
    .line 12
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    aget p3, v0, p3

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eq p3, v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 23
    .line 24
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->a(Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->d()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->c(Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->b(Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 41
    .line 42
    invoke-static {p2}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 47
    .line 48
    invoke-static {p2}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    const/4 v8, 0x0

    .line 53
    invoke-direct/range {v1 .. v8}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 54
    .line 55
    .line 56
    new-instance p2, Ll/s210;

    .line 57
    .line 58
    invoke-direct {p2, v1, p1}, Ll/s210;-><init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->A(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->B(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->C(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D([B)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->D([B)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->E(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->F(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->G(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H(Ll/wxh0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->H(Ll/wxh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->I(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public J(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->J(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K(Ll/w6m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->K(Ll/w6m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->L(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->M(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->N(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->O(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->P(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(Ll/wxh0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->Q(Ll/wxh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->R(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

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

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->S(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->T()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public U(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->U(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V(Ljava/lang/String;Ll/wxh0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->V(Ljava/lang/String;Ll/wxh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->W(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->X()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->Y(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z(Ljava/lang/Boolean;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->Z(Ljava/lang/Boolean;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->a0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->b0(Ljava/lang/String;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public c0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->c0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->d()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->d0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e0(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->e0(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->f()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->f0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()Ll/mob0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->g()Ll/mob0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->h(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h0(ILl/wxh0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->h0(ILl/wxh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->i()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->i0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j0(Ll/cgu;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->j0(Ll/cgu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->k()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->l(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->m(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->n(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->o(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->p(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->r()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/v6m;->release()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->b:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->d(Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->s(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public selectAudioTrack(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->selectAudioTrack(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setMusicVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->setMusicVolume(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopAllEffect()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->stopAllEffect()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->stopEffect(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->stopSurroundMusic()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->t(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(ILjava/lang/String;ZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Ll/v6m;->u(ILjava/lang/String;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Ll/zmw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->w(Ll/zmw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->x(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->y(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->z(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
