.class public Ll/ccn0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/ecn0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ecn0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/ecn0;-><init>(Ll/ccn0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/ccn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccn0;->V3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T3(Ll/ccn0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ccn0;->U3(Ljava/util/List;)V

    return-void
.end method

.method private synthetic V3(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/oqj;

    .line 2
    .line 3
    const/16 v1, 0x1b64

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/oqj;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/util/Pair;

    .line 13
    .line 14
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Ljava/lang/CharSequence;

    .line 17
    .line 18
    const-string v2, "voiceLiveMain"

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ljava/lang/CharSequence;

    .line 29
    .line 30
    const-string v1, "voiceLiveVice"

    .line 31
    .line 32
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    :cond_0
    new-instance v0, Ll/vme0;

    .line 39
    .line 40
    const/16 v1, 0x2bc

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ll/vme0;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/util/Collection;

    .line 50
    .line 51
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    const-string p0, "\u8bf7\u5148\u9009\u62e9\u4e00\u4e2a\u6536\u793c\u4eba"

    .line 58
    .line 59
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast v0, Ll/ecn0;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/ccn0;->X3(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method


# virtual methods
.method public final synthetic U3(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ecn0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ecn0;->I(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ecn0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->performCpGiftItemClick()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/ccn0;->j:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final X3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ccn0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/n0m0;->c(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/z86;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/z86;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/bcn0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/bcn0;-><init>(Ll/ccn0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->showCpGiftDetailDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/acn0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/acn0;-><init>(Ll/ccn0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
