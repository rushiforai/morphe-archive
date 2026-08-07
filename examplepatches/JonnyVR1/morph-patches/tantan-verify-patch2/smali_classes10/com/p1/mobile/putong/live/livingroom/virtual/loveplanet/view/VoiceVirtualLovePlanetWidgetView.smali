.class public Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/ndp0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/d55;

.field public B:Ljava/lang/String;

.field public C:Ll/w2m;

.field public D:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/w2m;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Landroidx/constraintlayout/widget/Guideline;

.field public f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public h:Lv/VLinear;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/TextView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public q:Lv/VLinear;

.field public r:Landroid/widget/ImageView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/view/FocusTextView;

.field public t:Landroid/view/View;

.field public u:Landroid/widget/TextView;

.field public v:Landroid/widget/ImageView;

.field public w:Landroid/widget/FrameLayout;

.field public x:Landroid/animation/Animator;

.field public y:Ll/ndp0;

.field public z:[Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->D:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->D:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->D:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetViewTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetViewTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->s0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ndp0;->v4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ndp0;->w4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ndp0;->t4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->v:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-gez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->v:Landroid/widget/ImageView;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->v:Landroid/widget/ImageView;

    .line 20
    .line 21
    new-instance v0, Ll/lfp0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/lfp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public D0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "introduction"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "choice"

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x2

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-string v0, "result"

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 p1, 0x3

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-string v0, "trip"

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    const/4 p1, 0x4

    .line 41
    goto :goto_0

    .line 42
    :cond_3
    move p1, v1

    .line 43
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->z:[Landroid/widget/TextView;

    .line 44
    .line 45
    array-length v2, v0

    .line 46
    if-ge v1, v2, :cond_5

    .line 47
    .line 48
    if-ge v1, p1, :cond_4

    .line 49
    .line 50
    aget-object v0, v0, v1

    .line 51
    .line 52
    sget v2, Ll/n9c0;->e1:I

    .line 53
    .line 54
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->z:[Landroid/widget/TextView;

    .line 62
    .line 63
    aget-object v0, v0, v1

    .line 64
    .line 65
    sget v2, Ll/obc0;->F:I

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_4
    aget-object v0, v0, v1

    .line 72
    .line 73
    sget v2, Ll/n9c0;->m1:I

    .line 74
    .line 75
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->z:[Landroid/widget/TextView;

    .line 83
    .line 84
    aget-object v0, v0, v1

    .line 85
    .line 86
    sget v2, Ll/obc0;->G:I

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 89
    .line 90
    .line 91
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->D:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-static {v0, p1, v1}, Ll/ifw;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;Ljava/util/HashMap;)Ll/w2m;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ll/w2m;->getViewId()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 24
    .line 25
    invoke-interface {v2}, Ll/w2m;->getViewId()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eq v1, v2, :cond_1

    .line 30
    .line 31
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->w:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->w:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    move-object v2, v0

    .line 39
    check-cast v2, Landroid/view/View;

    .line 40
    .line 41
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    sget v4, Ll/bnl0;->e:I

    .line 44
    .line 45
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 54
    .line 55
    invoke-interface {v0, v1}, Ll/w2m;->W(Ll/ndp0;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 59
    .line 60
    invoke-interface {p0, p1}, Ll/w2m;->c0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public G0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->ga:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v1, v0

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/rwn0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    new-instance v6, Ll/nfp0;

    .line 56
    .line 57
    invoke-direct {v6}, Ll/nfp0;-><init>()V

    .line 58
    .line 59
    .line 60
    move-object v2, p1

    .line 61
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    sget v0, Ll/qa00;->c:I

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const/16 v1, 0x4b

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget v1, Ll/qa00;->i:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sget v1, Ll/n9c0;->e1:I

    .line 96
    .line 97
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    filled-new-array {v1}, [I

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-wide/16 v1, 0x1388

    .line 116
    .line 117
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetViewTag()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v0, p1, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)Z
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;->fromUserId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-interface {v1, v0}, Ll/w2m;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v1, v2

    .line 14
    :goto_0
    if-eqz v1, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v3, Ll/yec0;->ga:I

    .line 25
    .line 26
    invoke-virtual {v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    move-object v2, v0

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ll/rwn0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ll/rwn0;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    new-instance v7, Ll/mfp0;

    .line 70
    .line 71
    invoke-direct {v7}, Ll/mfp0;-><init>()V

    .line 72
    .line 73
    .line 74
    move-object v3, p1

    .line 75
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-direct {p1, p0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    sget p0, Ll/qa00;->c:I

    .line 88
    .line 89
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const/16 v0, 0x4b

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    sget v0, Ll/qa00;->t:I

    .line 104
    .line 105
    neg-int v0, v0

    .line 106
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    sget v0, Ll/n9c0;->e1:I

    .line 111
    .line 112
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    filled-new-array {v0}, [I

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-wide/16 v2, 0x1388

    .line 131
    .line 132
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindPlayerInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 140
    .line 141
    const/4 v0, 0x3

    .line 142
    if-eq p0, v0, :cond_2

    .line 143
    .line 144
    const/4 v0, 0x4

    .line 145
    if-eq p0, v0, :cond_1

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_1
    sget p0, Ll/qa00;->i:I

    .line 149
    .line 150
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 151
    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_2
    sget p0, Ll/qa00;->i:I

    .line 155
    .line 156
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 157
    .line 158
    .line 159
    :goto_1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetViewTag()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    const/4 p0, 0x1

    .line 171
    return p0

    .line 172
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showSayHiBubble()Ll/v3f$d;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 185
    .line 186
    .line 187
    const/4 p0, 0x0

    .line 188
    return p0
.end method

.method public final I0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public J0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 21
    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->s0()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void

    .line 31
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->I0()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public W(Ll/ndp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ndp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->W(Ll/ndp0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ofp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    shr-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    new-array v0, v0, [F

    .line 18
    .line 19
    fill-array-data v0, :array_0

    .line 20
    .line 21
    .line 22
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 23
    .line 24
    invoke-static {p0, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-wide/16 v1, 0xfa

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 39
    .line 40
    sget-object v1, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->I0()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "greeting"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->A:Ll/d55;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/d55;->b()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->n0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->l:Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->m:Landroid/widget/TextView;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->n:Landroid/widget/TextView;

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->o:Landroid/widget/TextView;

    .line 14
    .line 15
    filled-new-array {v0, v1, v2, v3}, [Landroid/widget/TextView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->z:[Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 22
    .line 23
    const/high16 v1, 0x43ae0000    # 348.0f

    .line 24
    .line 25
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 33
    .line 34
    sget v1, Ll/qa00;->i:I

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    const/4 v2, 0x1

    .line 43
    const-string v3, "https://fe-static.tancdn.com/v1/raw/72abc4b8-2889-4d9b-80f0-e50c0ee2a24812.svga"

    .line 44
    .line 45
    const/4 v4, -0x1

    .line 46
    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 50
    .line 51
    new-instance v1, Ll/ifp0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/ifp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 60
    .line 61
    new-instance v1, Ll/jfp0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/jfp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->u:Landroid/widget/TextView;

    .line 70
    .line 71
    new-instance v1, Ll/kfp0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/kfp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ll/d55;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getCountDownProgressView()Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-direct {v0, v1}, Ll/d55;-><init>(Lcom/p1/mobile/putong/live/base/view/CircularProgressView;)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->A:Ll/d55;

    .line 91
    .line 92
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->y:Ll/ndp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ndp0;->y4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    shr-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    new-array v0, v0, [F

    .line 22
    .line 23
    fill-array-data v0, :array_0

    .line 24
    .line 25
    .line 26
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 27
    .line 28
    invoke-static {p0, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v0}, [Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-wide/16 v1, 0xfa

    .line 37
    .line 38
    invoke-static {v1, v2, v0}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 43
    .line 44
    sget-object v1, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->x:Landroid/animation/Animator;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final u0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, "https://fe-static.tancdn.com/v1/raw/dca27774-97f5-4987-b63e-14793e7db35912.svga"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->circleVoicingUrl:Ljava/lang/String;

    .line 9
    .line 10
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->B:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->B:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 30
    .line 31
    const/4 v0, -0x1

    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public v0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->u:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {v1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->u:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/hfw;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ll/hfw;->l(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->J0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2, v1}, Ll/hfw;->p(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->C:Ll/w2m;

    .line 32
    .line 33
    invoke-interface {p0, p1, v0}, Ll/w2m;->Z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public y0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V
    .locals 4

    .line 1
    const/high16 v0, 0x42480000    # 50.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->avatar:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_3

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->A:Ll/d55;

    .line 15
    .line 16
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ll/d55;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v2, v1

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->getAvatarUrl()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    move-object v3, v1

    .line 45
    :goto_1
    if-eqz v2, :cond_2

    .line 46
    .line 47
    iget-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    invoke-static {p0, v0, p1, v3, v1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 54
    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v3, "res://drawable/"

    .line 62
    .line 63
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sget v3, Ll/obc0;->Ga:I

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {p1, v0, v2, v1, v1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->I0()V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->A:Ll/d55;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/d55;->b()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V
    .locals 6

    .line 1
    const/high16 v0, 0x42480000    # 50.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->avatar:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_4

    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v2, v1

    .line 22
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->avatar:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move-object v5, v1

    .line 36
    :goto_1
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iget-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 39
    .line 40
    :cond_2
    invoke-static {v3, v0, v4, v5, v1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->sendScore:J

    .line 44
    .line 45
    const-wide/16 v2, 0x0

    .line 46
    .line 47
    cmp-long v2, v0, v2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->s:Lcom/p1/mobile/putong/live/livingroom/view/FocusTextView;

    .line 50
    .line 51
    if-lez v2, :cond_3

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userName:Ljava/lang/String;

    .line 54
    .line 55
    long-to-double v0, v0

    .line 56
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string v0, "%s:%s\u661f\u52a8\u503c"

    .line 65
    .line 66
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userName:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->s:Lcom/p1/mobile/putong/live/livingroom/view/FocusTextView;

    .line 81
    .line 82
    const-string v2, "MVP"

    .line 83
    .line 84
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetWidgetView;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 88
    .line 89
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v2, "res://drawable/"

    .line 96
    .line 97
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget v2, Ll/obc0;->Fa:I

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {p0, p1, v0, v1, v1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
