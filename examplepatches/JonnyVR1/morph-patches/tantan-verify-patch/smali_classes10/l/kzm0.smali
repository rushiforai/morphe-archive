.class public Ll/kzm0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/nzm0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ork0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ipk0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/ipk0;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/ork0;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    new-array v0, v0, [Ll/ork0;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    aput-object p1, v0, v1

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/kzm0;->i:Ljava/util/List;

    .line 26
    .line 27
    new-instance v0, Ll/fzm0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/fzm0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Ll/kzm0;->i:Ljava/util/List;

    .line 37
    .line 38
    new-instance v1, Ll/gzm0;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/gzm0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/nzm0;

    .line 48
    .line 49
    invoke-direct {v1, p1, v0}, Ll/nzm0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ll/l6t;->C(Ll/iam;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic J3(Ll/kzm0;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kzm0;->P3(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/ork0;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/ork0;->getView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L3(Ll/kzm0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kzm0;->U3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic M3(Ll/kzm0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kzm0;->R3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic N3(Ll/ork0;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/ork0;->getTabName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic P3(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nzm0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nzm0;->f()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic R3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    const-string p1, "page_apply"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kzm0;->O3(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/kzm0;->T3(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final O3(Ljava/lang/String;)I
    .locals 2

    .line 1
    const-string p0, "page_invite"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const-string v0, "page_apply"

    .line 12
    .line 13
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 p0, 0x2

    .line 28
    return p0

    .line 29
    :cond_2
    return v1
.end method

.method public S3(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kzm0;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ork0;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/ork0;->c()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->openVoiceCallDlgEvent()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/hzm0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/hzm0;-><init>(Ll/kzm0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateApplyCountEvent()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/izm0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/izm0;-><init>(Ll/kzm0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/jzm0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/jzm0;-><init>(Ll/kzm0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final T3(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nzm0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/kzm0;->i:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/ork0;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/ork0;->getTabName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p1, p0}, Ll/nzm0;->n(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final U3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nzm0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nzm0;->p()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/kzm0;->O3(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/nzm0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/nzm0;->i()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eq p1, v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/nzm0;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/nzm0;->m(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0, p1}, Ll/kzm0;->S3(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1}, Ll/kzm0;->T3(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
