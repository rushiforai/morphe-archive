.class public Ll/vew;
.super Ll/lq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lq2<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;",
        "Ll/ndp0;",
        ">;"
    }
.end annotation


# instance fields
.field public h:Ll/e9m0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/e9m0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Ll/e9m0;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "lovePlanet"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p1, v0}, Ll/lq2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Ll/vew;->h:Ll/e9m0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Ra:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic h()Ll/l6t;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vew;->s()Ll/ndp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lq2;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/vew;->h:Ll/e9m0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/e9m0;->L3()Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/lq2;->c:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->o0()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lq2;->p()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/vew;->h:Ll/e9m0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/e9m0;->L3()Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/lq2;->c:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->t0()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public r(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lq2;->r(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 13
    .line 14
    const/high16 p1, 0x41400000    # 12.0f

    .line 15
    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 21
    .line 22
    const/high16 p1, 0x41200000    # 10.0f

    .line 23
    .line 24
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public s()Ll/ndp0;
    .locals 1

    .line 1
    new-instance v0, Ll/ndp0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lq2;->a:Ll/dum;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/ndp0;-><init>(Ll/dum;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
