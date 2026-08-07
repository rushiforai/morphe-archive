.class public Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;
.super Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public z:Ll/q4;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wfs;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wfs;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/xfs;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/xfs;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->S4()V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->Q4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static O4(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "LIVE_ANCHOR_START_DATA"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private Q4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q4;->P3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private S4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/i6t;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public final P4(Ll/oo2;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Ll/jlm0;
    .locals 1

    .line 1
    instance-of p0, p1, Ll/jlm0;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Ll/jlm0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/oo2;->H0()Ll/c0m;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/oo2;->H0()Ll/c0m;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string p2, "[live][voice]"

    .line 37
    .line 38
    invoke-static {p2, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-object p0

    .line 42
    :cond_1
    new-instance p0, Ll/jlm0;

    .line 43
    .line 44
    new-instance p1, Ll/szn0;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/szn0;-><init>()V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/ajt;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {v0, p2}, Ll/ajt;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, p1, v0}, Ll/jlm0;-><init>(Ll/szn0;Ll/ajt;)V

    .line 57
    .line 58
    .line 59
    return-object p0
.end method

.method public final R4(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->isFromFloatWindow:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/o5c;->a()Ll/o5c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/o5c;->b()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    new-instance v1, Ll/b4o0;

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->P4(Ll/oo2;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Ll/jlm0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {v1, p0, p1, v0}, Ll/b4o0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Ll/jlm0;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 27
    .line 28
    return-void
.end method

.method public d4()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    const-string v0, "context_square"

    .line 5
    .line 6
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "context_common"

    .line 10
    .line 11
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "context_live_activities"

    .line 15
    .line 16
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string v1, "LIVE_ANCHOR_START_DATA"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 33
    .line 34
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    const-string v2, "type_normal_live"

    .line 41
    .line 42
    :cond_1
    const-string v3, "type_voice_live"

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_2

    .line 49
    .line 50
    new-instance v2, Ll/xct;

    .line 51
    .line 52
    invoke-direct {v2, p0, v1, v0}, Ll/xct;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->R4(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->traceId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/vp20;->w(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q4;->N3()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q4;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveFrag;->z:Ll/q4;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/q4;->O3(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
