.class public Ll/z2m0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/f3m0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/ImageView;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/widget/ScrollView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

.field public r:Landroid/widget/TextView;

.field public s:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;


# direct methods
.method public constructor <init>(Ll/f3m0;)V
    .locals 3
    .param p1    # Ll/f3m0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->G6:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x3e99999a    # 0.3f

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ll/qag0;->c(F)Ll/rq2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic F(Ll/z2m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z2m0;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/z2m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2m0;->L(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V

    return-void
.end method

.method public static synthetic H(Ll/z2m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z2m0;->K(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/z2m0;->s:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast v0, Ll/f3m0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/f3m0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a3m0;->a(Ll/z2m0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z2m0;->s:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;

    .line 2
    .line 3
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z2m0;->q:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

    .line 2
    .line 3
    new-instance v1, Ll/y2m0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/y2m0;-><init>(Ll/z2m0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->setSelectListener(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/z2m0;->q:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->e(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/z2m0;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/z2m0;->n:Landroid/widget/ImageView;

    .line 8
    .line 9
    new-instance v0, Ll/w2m0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/w2m0;-><init>(Ll/z2m0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/z2m0;->r:Landroid/widget/TextView;

    .line 18
    .line 19
    new-instance v0, Ll/x2m0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/x2m0;-><init>(Ll/z2m0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/z2m0;->q:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
