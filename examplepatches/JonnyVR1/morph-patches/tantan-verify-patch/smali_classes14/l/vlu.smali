.class public Ll/vlu;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/knu;",
        ">",
        "Ll/ahu<",
        "Ll/jku;",
        ">;"
    }
.end annotation


# instance fields
.field public f:J

.field public g:Ljava/lang/String;

.field public final h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/xxj;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/cqj;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/qul;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:Ll/wuj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wuj<",
            "*>;"
        }
    .end annotation
.end field

.field public n:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/vlu;->n3()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/vlu;->g:Ljava/lang/String;

    .line 9
    .line 10
    new-instance p1, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/vlu;->h:Ljava/util/Map;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Ll/vlu;->l:Z

    .line 19
    .line 20
    new-instance p1, Ll/jku;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/jku;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic B3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vlu;->b4()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic R2(Ljava/util/List;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S2(Ll/vlu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vlu;->K3(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T2(Ll/vlu;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/vlu;->J3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic U2(Ll/vlu;Ll/xxj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->H3(Ll/xxj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V2(Ll/vlu;Ll/xpj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->E3(Ll/xpj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W2(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X2(Ll/vlu;Ll/r7f0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->D3(Ll/r7f0;)V

    return-void
.end method

.method public static synthetic Y2(Ll/vlu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->C3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Z2(Ll/vlu;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->M3(Ll/xxj;)V

    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b3(Ll/vlu;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->I3(Ll/xxj;)V

    return-void
.end method

.method public static synthetic c3(Ll/vlu;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->N3(Ll/xxj;)V

    return-void
.end method

.method public static synthetic d3(Ll/vlu;Ll/eqj;)Ll/e060;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->F3(Ll/eqj;)Ll/e060;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/vlu;Ll/lx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->z3(Ll/lx50;)V

    return-void
.end method

.method public static synthetic f3(Ll/vlu;Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vlu;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic g3(Ll/vlu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vlu;->B3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h3(Ll/vlu;Ll/kne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->t3(Ll/kne0;)V

    return-void
.end method

.method public static synthetic i3(Ll/vlu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vlu;->G3(Ljava/lang/Long;)V

    return-void
.end method

.method private n3()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live"

    .line 2
    .line 3
    return-object p0
.end method

.method private w3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->C()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/flu;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/flu;-><init>(Ll/vlu;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/glu;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/glu;-><init>(Ll/vlu;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/xnu;->q()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/hlu;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/hlu;-><init>(Ll/vlu;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public final synthetic C3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/vlu;->U3(Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic D3(Ll/r7f0;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/r7f0;->b()Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/r7f0;->a()Ll/y20;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Ll/r7f0;->c()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/vlu;->a4(Ll/y20;Ll/y20;J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic E3(Ll/xpj;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-wide v0, p1, Ll/xpj;->c:D

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/vlu;->x3(D)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic F3(Ll/eqj;)Ll/e060;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jku;->p()Ll/e060;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic G3(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/vlu;->f:J

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic H3(Ll/xxj;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vlu;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/vlu;->y3(Ll/xxj;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0, v0}, Ll/vlu;->Z3(ZZ)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/xxj;->j()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic I3(Ll/xxj;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vlu;->h:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xxj;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vlu;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p1, Ll/jku;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/jku;->q()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Ll/vlu;->e4(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    move v0, p5

    .line 2
    move-object p5, p4

    .line 3
    move-object p4, p7

    .line 4
    move p7, p6

    .line 5
    move p6, v0

    .line 6
    invoke-virtual/range {p0 .. p7}, Ll/vlu;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/y20;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic K3(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/vlu;->s3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/vlu;->n:Landroid/util/Pair;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "live"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p2}, Ll/ere;->s(Landroid/util/Pair;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic M3(Ll/xxj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jku;->y(Ll/xxj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N3(Ll/xxj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jku;->y(Ll/xxj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final O3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vlu;->j:Ljava/util/Map;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/blu;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/blu;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vlu;->r3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ll/dpj;->y(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->a()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    iput-object v0, p0, Ll/vlu;->k:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Ll/vlu;->l:Z

    .line 31
    .line 32
    invoke-static {}, Ll/m0k;->h()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/r230;->s()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public R3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vlu;->n:Landroid/util/Pair;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/vlu;->n:Landroid/util/Pair;

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1}, Ll/ere;->a(Landroid/util/Pair;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public S3(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;)V
    .locals 3

    .line 1
    new-instance v0, Ll/oku;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->h:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogBottomBar;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ll/oku;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogBottomBar;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/wuj;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 24
    .line 25
    invoke-direct {v0, v1, v2, p1}, Ll/wuj;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ll/wuj;

    .line 33
    .line 34
    iput-object p1, p0, Ll/vlu;->m:Ll/wuj;

    .line 35
    .line 36
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/jku;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/jku;->s(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->f()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/mlu;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/mlu;-><init>(Ll/vlu;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->e()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/nlu;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/nlu;-><init>(Ll/vlu;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/olu;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/olu;-><init>(Ll/vlu;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->h()Ll/v3f$d;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lrx/c;

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/plu;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/plu;-><init>(Ll/vlu;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->i()Ll/v3f$d;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Lrx/c;

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v1, Ll/qlu;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/qlu;-><init>(Ll/vlu;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    new-instance v0, Ll/rlu;

    .line 145
    .line 146
    invoke-direct {v0, p0}, Ll/rlu;-><init>(Ll/vlu;)V

    .line 147
    .line 148
    .line 149
    const-class v1, Ll/xpj;

    .line 150
    .line 151
    invoke-virtual {p0, v1, v0}, Ll/ahu;->F2(Ljava/lang/Class;Ll/qcj;)V

    .line 152
    .line 153
    .line 154
    new-instance v0, Ll/slu;

    .line 155
    .line 156
    invoke-direct {v0, p0}, Ll/slu;-><init>(Ll/vlu;)V

    .line 157
    .line 158
    .line 159
    const-class v1, Ll/eqj;

    .line 160
    .line 161
    invoke-virtual {p0, v1, v0}, Ll/ahu;->F2(Ljava/lang/Class;Ll/qcj;)V

    .line 162
    .line 163
    .line 164
    invoke-static {}, Ll/m0k;->d()V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public T3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vlu;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/vlu;->k:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    :goto_0
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/vlu;->U3(Ljava/lang/String;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final U3(Ljava/lang/String;Ll/x20;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/vlu;->j3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Ll/uxj$a;

    .line 18
    .line 19
    iget-object p0, p0, Ll/vlu;->g:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v3, v0, v1, p0}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, p1}, Ll/uxj$a;->h(Ljava/lang/String;)Ll/uxj$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p2}, Ll/uxj$a;->g(Ll/x20;)Ll/uxj$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/uxj$a;->f()Ll/uxj;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Ll/ulu;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/ulu;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, p0, p1}, Ll/xnu;->N(Ll/uxj;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public V3(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IIZ)V
    .locals 10
    .param p3    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;IIZ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    iget v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v8

    .line 11
    new-instance v0, Ll/ilu;

    .line 12
    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p2

    .line 15
    move-object v5, p3

    .line 16
    move v6, p5

    .line 17
    move/from16 v7, p6

    .line 18
    .line 19
    move-object v2, v1

    .line 20
    move-object v1, p0

    .line 21
    invoke-direct/range {v0 .. v7}, Ll/ilu;-><init>(Ll/vlu;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IZ)V

    .line 22
    .line 23
    .line 24
    move-object v1, v2

    .line 25
    new-instance v2, Ll/jlu;

    .line 26
    .line 27
    invoke-direct {v2, p0, p2, v1}, Ll/jlu;-><init>(Ll/vlu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ll/klu;

    .line 31
    .line 32
    invoke-direct {v4}, Ll/klu;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v7, p0, Ll/vlu;->g:Ljava/lang/String;

    .line 36
    .line 37
    move-object p2, v2

    .line 38
    move-object v2, v0

    .line 39
    move-object v0, v8

    .line 40
    iget-object v8, p0, Ll/vlu;->i:Ll/cqj;

    .line 41
    .line 42
    invoke-static {v1, p1, p5}, Ll/dpj;->v(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 43
    .line 44
    .line 45
    move-result-object v9

    .line 46
    const/4 v5, 0x0

    .line 47
    move-object v3, p2

    .line 48
    move v6, p4

    .line 49
    invoke-static/range {v0 .. v9}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Ll/vlu;->W3(Ll/uoe0;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public W3(Ll/uoe0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SendGiftEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;->a()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/hne0$a;->y(Ll/uoe0;)Ll/hne0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public X3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vlu;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Y3(Ll/lx50;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/jku;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/jku;->A()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->a()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ll/lx50;->e()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1, p2}, Ll/vlu;->d4(Ljava/util/List;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->b()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-boolean p1, p0, Ll/vlu;->l:Z

    .line 55
    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/vlu;->T3()V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Ll/vlu;->l:Z

    .line 63
    .line 64
    :cond_0
    invoke-virtual {p0}, Ll/vlu;->v3()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final Z3(ZZ)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0, p2}, Ll/xxj;->b(ZZZ)Ll/xxj;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/jku;->y(Ll/xxj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final a4(Ll/y20;Ll/y20;J)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;J)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/jku;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    move-object v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move-wide v5, p3

    .line 13
    invoke-virtual/range {v1 .. v6}, Ll/jku;->B(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/vlu;->T3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/xnu;->Q()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    const-string v0, "live"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/xnu;->v()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {p0}, Ll/vlu;->j3()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v1, v2, v3, v0}, Ll/ere;->z(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Ll/htd0;->c:Ll/htd0;

    .line 45
    .line 46
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ll/hiv;

    .line 51
    .line 52
    invoke-virtual {v2}, Ll/hiv;->q()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {v2, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ll/hiv;

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/hiv;->s()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    new-instance v3, Ll/dlu;

    .line 76
    .line 77
    invoke-direct {v3}, Ll/dlu;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v2, v1, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    new-instance v2, Ll/elu;

    .line 109
    .line 110
    invoke-direct {v2, p0, v0}, Ll/elu;-><init>(Ll/vlu;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    invoke-direct {p0}, Ll/vlu;->w3()V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public c4(Ll/lx50;Z)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/lx50;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/lx50;->a()Ll/cqj;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "default"

    .line 10
    .line 11
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Ll/vlu;->n3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/vlu;->m3()Ll/cqj;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_0
    invoke-virtual {p1}, Ll/lx50;->b()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x3e8

    .line 30
    .line 31
    if-ne v2, v3, :cond_1

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/cqj;->g()Ll/coj;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Ll/coj;->e:Ll/h64;

    .line 40
    .line 41
    const-string v3, ""

    .line 42
    .line 43
    iput-object v3, v2, Ll/h64;->a:Ljava/lang/String;

    .line 44
    .line 45
    :cond_1
    iget-object v2, p0, Ll/vlu;->g:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_2

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {p0, v2, p2}, Ll/vlu;->Z3(ZZ)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iput-object v0, p0, Ll/vlu;->g:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, p0, Ll/vlu;->i:Ll/cqj;

    .line 60
    .line 61
    invoke-virtual {p0, p1, p2}, Ll/vlu;->Y3(Ll/lx50;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final d4(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vlu;->q3()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/xxj;->n(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/xxj$a;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {p1, v1, v2, p2}, Ll/xxj$a;-><init>(ZZZ)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/xxj;->k(Ll/xxj$a;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/tlu;

    .line 21
    .line 22
    invoke-direct {p1, p0, v0}, Ll/tlu;-><init>(Ll/vlu;Ll/xxj;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final e4(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vlu;->q3()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/xxj$a;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v1, v2, p1, v2}, Ll/xxj$a;-><init>(ZZZ)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/xxj;->k(Ll/xxj$a;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/llu;

    .line 17
    .line 18
    invoke-direct {p1, p0, v0}, Ll/llu;-><init>(Ll/vlu;Ll/xxj;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jku;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public j3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public k3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jku;->n()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public m3()Ll/cqj;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/vlu;->O3()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/m0k;->b()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/osj;->c()Ll/osj;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/osj;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public o3()Ll/e060;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jku;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jku;->p()Ll/e060;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public p3(Ljava/lang/String;)Ll/qul;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vlu;->j:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/vlu;->j:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/vlu;->j:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/qul;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :try_start_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 24
    .line 25
    .line 26
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-object v1, v0

    .line 29
    :goto_0
    if-nez v1, :cond_1

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->getController()Ll/qul;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Ll/vlu;->j:Ljava/util/Map;

    .line 37
    .line 38
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    :cond_2
    return-object v0
.end method

.method public final q3()Ll/xxj;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vlu;->h:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vlu;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/xxj;

    .line 10
    .line 11
    return-object p0
.end method

.method public final r3()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vlu;->q3()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xxj;->e()Ll/zxj;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final s3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 16
    .line 17
    const v1, 0xa0f1

    .line 18
    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->l1(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    if-eqz p0, :cond_1

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 29
    .line 30
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 31
    .line 32
    const p1, 0xa0f2

    .line 33
    .line 34
    .line 35
    if-ne p0, p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->l1(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final t3(Ll/kne0;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/kne0;->d()Ll/jjs;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Ll/kne0;->a()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/kne0;->c()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    invoke-virtual {p1}, Ll/kne0;->b()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    new-instance v3, Ll/clu;

    .line 18
    .line 19
    invoke-direct {v3}, Ll/clu;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    move-object v0, p0

    .line 24
    invoke-virtual/range {v0 .. v6}, Ll/vlu;->V3(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IIZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final u3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/y20;IZ)V
    .locals 1
    .param p5    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;IZ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p4}, Ll/jjs;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/jku;

    .line 9
    .line 10
    invoke-virtual {v0, p2, p4}, Ll/jku;->C(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, p2, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->h1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 14
    .line 15
    .line 16
    if-eqz p5, :cond_0

    .line 17
    .line 18
    invoke-interface {p5, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    move-object p4, p2

    .line 22
    new-instance p2, Ll/jb0;

    .line 23
    .line 24
    move p5, p6

    .line 25
    move p6, p7

    .line 26
    invoke-virtual {p0}, Ll/vlu;->o3()Ll/e060;

    .line 27
    .line 28
    .line 29
    move-result-object p7

    .line 30
    invoke-direct/range {p2 .. p7}, Ll/jb0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;IZLl/e060;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/vlu;->isShowing()Z

    .line 34
    .line 35
    .line 36
    move-result p4

    .line 37
    if-eqz p4, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Ll/vlu;->m:Ll/wuj;

    .line 40
    .line 41
    invoke-virtual {p0, p2}, Ll/wuj;->a3(Ll/jb0;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 45
    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/n0k;->g(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public v3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->d()Ll/v3f$c;

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

.method public x3(D)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vlu;->f:J

    .line 2
    .line 3
    long-to-double v0, v0

    .line 4
    cmpl-double p0, v0, p1

    .line 5
    .line 6
    if-ltz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final y3(Ll/xxj;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vlu;->h:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xxj;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/xxj;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xxj;->d()Ll/zxj;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public final synthetic z3(Ll/lx50;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/muj;->F(Ll/lx50;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/vlu;->R3()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/vlu;->c4(Ll/lx50;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
