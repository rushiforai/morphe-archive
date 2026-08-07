.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings<",
        "Ll/sf60;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001b\u0010\u000f\u001a\u00020\t2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0015\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0015\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0014R\u0016\u0010\u001a\u001a\u00020\u00178\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u001cR\u0016\u0010\u001f\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u001eR\"\u0010\'\u001a\u00020 8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008!\u0010\"\u001a\u0004\u0008#\u0010$\"\u0004\u0008%\u0010&\u00a8\u0006("
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;",
        "Ll/sf60;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "r",
        "()V",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;",
        "templates",
        "j",
        "(Ljava/util/List;)V",
        "",
        "collapse",
        "i",
        "(Z)V",
        "visible",
        "l",
        "Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;",
        "h",
        "Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;",
        "adapter",
        "Landroid/animation/Animator;",
        "Landroid/animation/Animator;",
        "animator",
        "Z",
        "isCollapse",
        "",
        "k",
        "I",
        "getExpandViewHeight",
        "()I",
        "setExpandViewHeight",
        "(I)V",
        "expandViewHeight",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public i:Landroid/animation/Animator;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public j:Z

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->l(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 5
    .line 6
    check-cast p0, Ll/sf60;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->collapsePanel()Ll/v3f$c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 22
    .line 23
    return-object p0
.end method

.method public static d(Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;)V
    .locals 1

    .line 1
    new-instance v0, Ll/l4m0;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/l4m0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/xf60;

    .line 7
    .line 8
    invoke-direct {p2, p1, v0}, Ll/xf60;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Ll/l4m0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Ll/l4m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->k(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Ll/l4m0;Landroid/view/View;)V

    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->f:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->l(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static final k(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;Ll/l4m0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/sf60;

    .line 4
    .line 5
    iget-object p1, p1, Ll/l4m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/sf60;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final getExpandViewHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public final i(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->f:Lv/VFrame;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-array v1, v1, [F

    .line 14
    .line 15
    fill-array-data v1, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-wide/16 v1, 0x12c

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->i:Landroid/animation/Animator;

    .line 29
    .line 30
    new-instance v1, Ll/tf60;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/tf60;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-array v1, v1, [F

    .line 40
    .line 41
    fill-array-data v1, :array_1

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-wide/16 v1, 0x190

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->i:Landroid/animation/Animator;

    .line 55
    .line 56
    new-instance v1, Ll/uf60;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/uf60;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->i:Landroid/animation/Animator;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    sget-object v1, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->i:Landroid/animation/Animator;

    .line 75
    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 79
    .line 80
    .line 81
    :cond_1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->j:Z

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->d:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final j(Ljava/util/List;)V
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGuideTemplate;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    check-cast p1, Ljava/util/Collection;

    .line 10
    .line 11
    new-instance v1, Ll/wf60;

    .line 12
    .line 13
    invoke-direct {v1, v0, p0}, Ll/wf60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    div-int/lit8 p1, p1, 0x2

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    rem-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    const/4 v3, 0x0

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    move v1, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v1, v2

    .line 38
    :goto_0
    add-int/2addr p1, v1

    .line 39
    const/high16 v1, 0x42180000    # 38.0f

    .line 40
    .line 41
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    mul-int/2addr v1, p1

    .line 46
    const/high16 v4, 0x41200000    # 10.0f

    .line 47
    .line 48
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    sub-int/2addr p1, v2

    .line 53
    mul-int/2addr v4, p1

    .line 54
    add-int/2addr v1, v4

    .line 55
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->k:I

    .line 56
    .line 57
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->j:Z

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->f:Lv/VFrame;

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    check-cast p1, Ll/i6t;

    .line 76
    .line 77
    invoke-static {p1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 85
    .line 86
    if-nez p0, :cond_2

    .line 87
    .line 88
    const-string p0, "adapter"

    .line 89
    .line 90
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x0

    .line 94
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final l(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 9
    .line 10
    check-cast p1, Ll/sf60;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/rwn0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {p1}, Ll/jkp0;->f(Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 27
    .line 28
    check-cast v0, Ll/sf60;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/rwn0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "roomId"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 47
    .line 48
    check-cast v1, Ll/sf60;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ll/rwn0;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v2, "anchorId"

    .line 61
    .line 62
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 67
    .line 68
    check-cast v2, Ll/sf60;

    .line 69
    .line 70
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Ll/rwn0;

    .line 75
    .line 76
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "liveId"

    .line 81
    .line 82
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    .line 90
    .line 91
    check-cast p0, Ll/i6t;

    .line 92
    .line 93
    invoke-static {p0}, Ll/i9o0;->l(Ll/i6t;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string v3, "user_type"

    .line 98
    .line 99
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    filled-new-array {v0, v1, v2, p0}, [Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v0, "e_audio_game_panel"

    .line 108
    .line 109
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 110
    .line 111
    .line 112
    :cond_0
    return-void
.end method

.method public final r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->d:Lv/VDraweeView;

    .line 2
    .line 3
    sget v1, Ll/obc0;->z9:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->e:Lv/VText;

    .line 9
    .line 10
    const-string v1, "\u6b64\u523b\uff0c\u4f60\u60f3\u505a\u70b9\u4ec0\u4e48\uff1f"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->c:Lv/VLinear;

    .line 16
    .line 17
    sget v1, Ll/qa00;->y:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->a:Ll/k3m;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    check-cast v0, Ll/i6t;

    .line 28
    .line 29
    invoke-static {v0}, Ll/ahn0;->b(Ll/i6t;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->e:Lv/VText;

    .line 33
    .line 34
    sget v1, Ll/n9c0;->m1:I

    .line 35
    .line 36
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->c:Lv/VLinear;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/vf60;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/vf60;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 57
    .line 58
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 64
    .line 65
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const/4 v3, 0x2

    .line 72
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 87
    .line 88
    if-nez v2, :cond_0

    .line 89
    .line 90
    const-string v2, "adapter"

    .line 91
    .line 92
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    move-object v1, v2

    .line 97
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ll/bhn0;->a()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->f:Lv/VFrame;

    .line 105
    .line 106
    const/4 v2, 0x1

    .line 107
    new-array v2, v2, [Landroid/view/View;

    .line 108
    .line 109
    const/4 v3, 0x0

    .line 110
    aput-object v1, v2, v3

    .line 111
    .line 112
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoicePanelUnknownViewBindings;->d:Lv/VDraweeView;

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->j:Z

    .line 118
    .line 119
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final setExpandViewHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/unknown/PanelUnknownView;->k:I

    .line 2
    .line 3
    return-void
.end method
