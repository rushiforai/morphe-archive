.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/nk00;

.field public B:Lcom/p1/mobile/putong/data/Links;

.field public C:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/hj00;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static N4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZLjava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/RawFeed;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;-><init>()V

    .line 2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 3
    const-string v2, "momentId"

    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    const-string p1, "from"

    invoke-virtual {v1, p1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    const-string p0, "momentOwner"

    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    const-string p0, "autoPlay"

    invoke-virtual {v1, p0, p3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 7
    const-string p0, "isHideComment"

    invoke-virtual {v1, p0, p5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 8
    const-string p0, "initMediaIndex"

    invoke-virtual {v1, p0, p4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 9
    const-string p0, "momentValue"

    invoke-virtual {v1, p0, p6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    const-string p0, "canGreeting"

    invoke-virtual {v1, p0, p7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 11
    const-string p0, "start_home_card"

    invoke-virtual {v1, p0, p8}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 12
    const-string p0, "msg_id"

    invoke-virtual {v1, p0, p9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    const-string p0, "enterPage"

    invoke-virtual {v1, p0, p10}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    const-string p0, "showInput"

    invoke-virtual {v1, p0, p11}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 15
    const-string p0, "rawFeed"

    invoke-virtual {v1, p0, p12}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 16
    invoke-static/range {p13 .. p13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 17
    const-string p0, "clickedMsgId"

    move-object/from16 p1, p13

    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private O4()V
    .locals 1

    .line 1
    new-instance v0, Ll/hj00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hj00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 7
    .line 8
    new-instance v0, Ll/nk00;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/nk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public M4(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hj00;->G0(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nk00;->d0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hj00;->S0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public R4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->O4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/hj00;->u:Z

    .line 12
    .line 13
    return-void
.end method

.method public S4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hj00;->n1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T4(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hj00;->o1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public U4(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hj00;->p1(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V4(Ll/bkj0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nk00;->Q0(Lcom/p1/mobile/putong/data/Links;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/hj00;->q1(Ll/bkj0;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 16
    .line 17
    iget-object p1, p1, Ll/hj00;->i:Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->B:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    return-void
.end method

.method public W4(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hj00;->r1(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nk00;->T0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y4(Ll/bkj0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Music;",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/hj00;->s1(Ll/bkj0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 7
    .line 8
    iget-object v0, v0, Ll/hj00;->i:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->B:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->C:Ll/y20;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->C:Ll/y20;

    .line 21
    .line 22
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public Z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nk00;->V0(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hj00;->u1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b5(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/nk00;->h1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->O4()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->z:Ll/hj00;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hj00;->a0()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/nk00;->a0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/nk00;->b0(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/nk00;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/nk00;->N0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->A:Ll/nk00;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nk00;->V()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
