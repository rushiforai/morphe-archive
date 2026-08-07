.class public Ll/xnu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public b:Ll/gcl0;

.field public c:Ll/ecl0;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

.field public k:Ll/kcg0;

.field public l:J

.field public m:Z

.field public n:Z

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

.field public p:Z

.field public final q:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/xxj;",
            ">;"
        }
    .end annotation
.end field

.field public final r:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/y20<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/xnu;->d:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/xnu;->i:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/xnu;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/xnu;->p:Z

    .line 25
    .line 26
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/xnu;->q:Lrx/subjects/a;

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/xnu;->r:Ljava/util/ArrayList;

    .line 38
    .line 39
    iput-boolean p1, p0, Ll/xnu;->a:Z

    .line 40
    .line 41
    new-instance p1, Ll/ecl0;

    .line 42
    .line 43
    invoke-direct {p1}, Ll/ecl0;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/xnu;->c:Ll/ecl0;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ll/xnu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xnu;->H(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic b(Ll/xnu;Ll/uxj;Ll/xxj;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xnu;->G(Ll/uxj;Ll/xxj;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/xnu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xnu;->D(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic d(Ll/y20;Ljava/util/List;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic f(Ll/xnu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xnu;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic g(Ll/xnu;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xnu;->F(Ll/y20;)V

    return-void
.end method

.method public static synthetic h(Ll/uxj;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;)Ll/xxj;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/dpj;->j(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;)Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Ll/xnu;Ll/ahu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xnu;->E(Ll/ahu;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j(Ll/ahu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k(Ll/xnu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xnu;->I(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l(Ll/xxj;)Ll/xxj;
    .locals 1

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/hiv;->F(Ll/xxj;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public static x(Ljava/lang/String;)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x2

    .line 11
    const/4 v4, 0x1

    .line 12
    const/4 v5, -0x1

    .line 13
    sparse-switch v1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v1, "calling"

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v5, v2

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v1, "pending"

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move v5, v3

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v1, "connecting"

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_3

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    move v5, v4

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v1, "stopped"

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_4

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    move v5, v0

    .line 60
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 61
    .line 62
    .line 63
    return v0

    .line 64
    :pswitch_0
    return v2

    .line 65
    :pswitch_1
    return v4

    .line 66
    :pswitch_2
    return v3

    .line 67
    :pswitch_3
    const/4 p0, 0x4

    .line 68
    return p0

    .line 69
    :sswitch_data_0
    .sparse-switch
        -0x70506e33 -> :sswitch_3
        -0x2e3b8148 -> :sswitch_2
        -0x28af7669 -> :sswitch_1
        0x20b398c4 -> :sswitch_0
    .end sparse-switch

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/xxj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xnu;->q:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic D(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 2

    .line 1
    const-string v0, "fakeCall"

    .line 2
    .line 3
    const-string v1, "sendStartReq"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic E(Ll/ahu;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const-string v0, "fakeCall"

    .line 2
    .line 3
    const-string v1, "sendStartReq"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-static {v0, v1, p2, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, v2}, Ll/xnu;->b0(Ll/ahu;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic F(Ll/y20;)V
    .locals 2

    .line 1
    :try_start_0
    iget-wide v0, p0, Ll/xnu;->l:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic G(Ll/uxj;Ll/xxj;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->q:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/uxj;->e()Ll/x20;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/uxj;->e()Ll/x20;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p2}, Ll/xxj;->e()Ll/zxj;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic I(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    invoke-static {p1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p1, "stopped"

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/xnu;->i0(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 13
    .line 14
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 21
    .line 22
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xnu;->U()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0}, Ll/xnu;->y()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-gt v0, v1, :cond_2

    .line 42
    .line 43
    :goto_0
    return-void

    .line 44
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/xnu;->M(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final L(Ljava/lang/Long;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 12
    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/32 v4, 0xf4240

    .line 18
    .line 19
    .line 20
    div-long/2addr v0, v4

    .line 21
    sub-long/2addr v2, v0

    .line 22
    const-wide/16 v0, 0x3e8

    .line 23
    .line 24
    div-long/2addr v2, v0

    .line 25
    iput-wide v2, p0, Ll/xnu;->l:J

    .line 26
    .line 27
    iget-object p1, p0, Ll/xnu;->r:Ljava/util/ArrayList;

    .line 28
    .line 29
    new-instance v0, Ll/mnu;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/mnu;-><init>(Ll/xnu;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xnu;->J(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iput-object p1, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xnu;->c0()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p0, p0, Ll/xnu;->d:Lrx/subjects/a;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public N(Ll/uxj;Ll/y20;)V
    .locals 2
    .param p2    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/uxj;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/uxj;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/uxj;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/jwu;->N(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/qnu;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/qnu;-><init>(Ll/uxj;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/rnu;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/rnu;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/snu;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Ll/snu;-><init>(Ll/xnu;Ll/uxj;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance p1, Ll/tnu;

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ll/tnu;-><init>(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public O(Ljava/lang/Long;)V
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/hiv;->C(Ljava/lang/Long;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->c:Ll/ecl0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ecl0;->l()Ll/aj1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/aj1;->f0(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCoin;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xnu;->r:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "requestForUpdateStatus:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v0, ""

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ll/xnu;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public T(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "request action:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",error:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "videoChat"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xnu;->p()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0, p1, p2}, Ll/jwu;->Z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/onu;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/onu;-><init>(Ll/xnu;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/pnu;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/pnu;-><init>(Ll/xnu;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xnu;->e0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public V()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/xnu;->d:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xnu;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 2
    .line 3
    return-void
.end method

.method public X(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xnu;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xnu;->i:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xnu;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    return-void
.end method

.method public a0(Landroid/app/Activity;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-interface {p3}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    new-instance p0, Ll/th0$a;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/nnu;

    .line 28
    .line 29
    invoke-direct {p1, p3}, Ll/nnu;-><init>(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "\u597d\u7684"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public b0(Ll/ahu;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 1

    .line 1
    instance-of p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const p3, 0x9c47

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-ne p0, p3, :cond_0

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->p(Ll/ahu;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/ahu;->L2(Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const p3, 0x9c49

    .line 23
    .line 24
    .line 25
    if-ne p0, p3, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Gb(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/ahu;->L2(Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object p3, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    if-eqz p2, :cond_3

    .line 46
    .line 47
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget p2, Lcom/p1/mobile/putong/live/external/R$string;->R:I

    .line 58
    .line 59
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    :cond_3
    :goto_0
    new-instance p0, Ll/th0$a;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-direct {p0, p2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 p2, 0x0

    .line 77
    invoke-virtual {p0, p2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p2, "\u597d\u7684"

    .line 82
    .line 83
    invoke-virtual {p0, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p2, Ll/unu;

    .line 88
    .line 89
    invoke-direct {p2, p1}, Ll/unu;-><init>(Ll/ahu;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public c0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xnu;->e0()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/lnu;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/lnu;-><init>(Ll/xnu;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/xnu;->k:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method

.method public d0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xnu;->c:Ll/ecl0;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/xnu;->a:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xnu;->g0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    const-string v5, ""

    .line 10
    .line 11
    move-object v4, p1

    .line 12
    move-object v2, p2

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/ecl0;->n(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xnu;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Ll/xnu;->l:J

    .line 9
    .line 10
    return-void
.end method

.method public f0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->c:Ll/ecl0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ecl0;->p()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xnu;->g:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/xnu;->g:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/xnu;->g:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0
.end method

.method public h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/yuk0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/xnu;->K(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p1, "stopped"

    .line 12
    .line 13
    const-string p2, ""

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ll/xnu;->i0(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public i0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, v0, p1}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xnu;->e0()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/xnu;->f0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xnu;->u()Ll/gcl0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/gcl0;->h()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n(Ll/ahu;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xnu;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/xnu;->i:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 6
    .line 7
    iget-object v2, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->source:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->recallId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v2, v1}, Ll/jwu;->V(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/vnu;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/vnu;-><init>(Ll/xnu;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/wnu;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1}, Ll/wnu;-><init>(Ll/xnu;Ll/ahu;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public q()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hiv;->h()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public r(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public s()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public t()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xnu;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public u()Ll/gcl0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xnu;->b:Ll/gcl0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/gcl0;

    .line 6
    .line 7
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/gcl0;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/xnu;->b:Ll/gcl0;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/xnu;->b:Ll/gcl0;

    .line 15
    .line 16
    return-object p0
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->i:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public z()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xnu;->d:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method
