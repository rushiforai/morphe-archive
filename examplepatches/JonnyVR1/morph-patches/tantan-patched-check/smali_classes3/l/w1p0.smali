.class public Ll/w1p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/rzo0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->ya:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/w1p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w1p0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/w1p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w1p0;->J(Landroid/view/View;)V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object v0, p0, Ll/w1p0;->n:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/rzo0;->Y3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x1p0;->a(Ll/w1p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ll/rzo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/w1p0;->n:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w1p0;->I(Ll/rzo0;)V

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

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/w1p0;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/w1p0;->k:Lv/VImage;

    .line 8
    .line 9
    new-instance v0, Ll/u1p0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/u1p0;-><init>(Ll/w1p0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/w1p0;->m:Lv/VText;

    .line 18
    .line 19
    new-instance v0, Ll/v1p0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/v1p0;-><init>(Ll/w1p0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w1p0;->I(Ll/rzo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
