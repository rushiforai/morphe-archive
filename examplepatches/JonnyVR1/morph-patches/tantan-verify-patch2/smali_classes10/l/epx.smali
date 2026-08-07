.class public Ll/epx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/jpx;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

.field public b:Ll/jpx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/jpx<",
            "Ll/rwn0;",
            "Ll/epx;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/tox;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;->i0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/epx;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/epx;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/epx;->f(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/epx;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/epx;->j(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/epx;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/epx;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    return-void
.end method

.method private synthetic f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/epx;->b:Ll/jpx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jpx;->e4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "locked"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/epx;->b:Ll/jpx;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jpx;->Z3()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "\u6682\u672a\u70b9\u4eae\u8be5\u52cb\u7ae0\uff0c\u5feb\u53bb\u6536\u96c6\u793c\u7269\u5427\uff5e"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "\u8be5\u7528\u6237\u6682\u672a\u70b9\u4eae\u52cb\u7ae0\uff0c\u5feb\u53bb\u9001\u5979/\u4ed6\u793c\u7269\u5427\uff5e"

    .line 21
    .line 22
    :goto_0
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/epx;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ll/jpx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/epx;->b:Ll/jpx;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/epx;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/epx;->b:Ll/jpx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jpx;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/jpx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/epx;->d(Ll/jpx;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/epx;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;->setListData(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Ll/tox;

    .line 2
    .line 3
    iget-object v1, p0, Ll/epx;->b:Ll/jpx;

    .line 4
    .line 5
    new-instance v2, Ll/bpx;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/bpx;-><init>(Ll/epx;)V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ll/cpx;

    .line 11
    .line 12
    invoke-direct {v3, p0}, Ll/cpx;-><init>(Ll/epx;)V

    .line 13
    .line 14
    .line 15
    new-instance v4, Ll/dpx;

    .line 16
    .line 17
    invoke-direct {v4, p0}, Ll/dpx;-><init>(Ll/epx;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1, v2, v3, v4}, Ll/tox;-><init>(Ll/jpx;Ll/y20;Ll/y20;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/epx;->c:Ll/tox;

    .line 24
    .line 25
    iget-object v1, p0, Ll/epx;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;->k0(Ll/tox;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/epx;->c:Ll/tox;

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/tox;->G(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
