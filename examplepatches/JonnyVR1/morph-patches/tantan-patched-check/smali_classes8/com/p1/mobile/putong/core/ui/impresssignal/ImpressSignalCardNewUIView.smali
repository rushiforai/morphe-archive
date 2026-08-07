.class public Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

.field public b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public l:Lv/VLinear;

.field public m:Lv/VDraweeView;

.field public n:Lv/VDraweeView;

.field public o:Lv/VDraweeView;

.field public p:Lv/VLinear;

.field public q:Lv/VText;

.field public r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public s:Ll/snm;

.field public t:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

.field public u:J

.field public v:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->o(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->p(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->q([I)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;JLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->t(JLjava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public final m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bom;->a(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/upm;->E(Lcom/p1/mobile/android/app/Act;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 23
    .line 24
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/f49;->v3(Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/xnm;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/xnm;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/ynm;

    .line 51
    .line 52
    invoke-direct {p0}, Ll/ynm;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->s:Ll/snm;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    iput-object v0, p2, Ll/snm;->d:Ljava/lang/Boolean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->u:J

    .line 9
    .line 10
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1, v0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->L(ZZZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 46
    .line 47
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->matched:Z

    .line 48
    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 60
    .line 61
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    new-instance v0, Ll/znm;

    .line 78
    .line 79
    invoke-direct {v0, p0, p1}, Ll/znm;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Ll/aom;

    .line 83
    .line 84
    invoke-direct {p0}, Ll/aom;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->s:Ll/snm;

    .line 96
    .line 97
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 98
    .line 99
    iput-object v0, p2, Ll/snm;->d:Ljava/lang/Boolean;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 110
    .line 111
    .line 112
    const-string p0, "\u5bf9\u65b9\u4fe1\u53f7\u6ce2\u52a8\uff0c\u6682\u65f6\u65e0\u6cd5\u63a5\u6536"

    .line 113
    .line 114
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    return-void
.end method

.method public final synthetic q([I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->c:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->d:Landroid/view/View;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->d:Landroid/view/View;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sub-int/2addr v0, v1

    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->c:Landroid/view/View;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/high16 v1, 0x42ce0000    # 103.0f

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sub-int/2addr v0, v1

    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 60
    .line 61
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "receiver_user_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_love_signal_photo"

    .line 14
    .line 15
    const-string v1, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "impress_signal"

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {p2, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Landroid/view/View;)V
    .locals 5

    .line 1
    const-string p4, "receiver_user_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p4, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    const-string v0, "remainingtimes"

    .line 18
    .line 19
    invoke-static {v0, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, ""

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->u:J

    .line 35
    .line 36
    sub-long/2addr v1, v3

    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "accept_duration"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Ll/upm;->Q()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "signal_resource"

    .line 59
    .line 60
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {p1, p4, v0, v1}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string p4, "e_love_signal_accept"

    .line 69
    .line 70
    const-string v0, "p_suggest_users_home_view"

    .line 71
    .line 72
    invoke-static {p4, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 76
    .line 77
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->y(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic t(JLjava/lang/Long;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-wide/16 p1, 0x3e8

    .line 7
    .line 8
    div-long/2addr v0, p1

    .line 9
    sget-wide p1, Ll/upm;->a:J

    .line 10
    .line 11
    cmp-long p1, v0, p1

    .line 12
    .line 13
    if-ltz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    .line 16
    .line 17
    invoke-static {p1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 73
    .line 74
    sget-object p2, Lcom/p1/mobile/putong/core/data/VirtualCardType;->ImpressSignalCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 75
    .line 76
    if-ne p1, p2, :cond_0

    .line 77
    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 83
    .line 84
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_0

    .line 93
    .line 94
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 97
    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 99
    .line 100
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 107
    .line 108
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_0

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->u()V

    .line 115
    .line 116
    .line 117
    :cond_0
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 40
    .line 41
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 51
    .line 52
    invoke-static {p0}, Ll/upm;->J(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    if-eqz v1, :cond_8

    .line 10
    .line 11
    if-eqz v2, :cond_8

    .line 12
    .line 13
    if-eqz v3, :cond_8

    .line 14
    .line 15
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    if-nez v4, :cond_0

    .line 20
    .line 21
    goto/16 :goto_3

    .line 22
    .line 23
    :cond_0
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->r:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 24
    .line 25
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->s:Ll/snm;

    .line 26
    .line 27
    iput-object v3, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->t:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 28
    .line 29
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v4, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_1

    .line 48
    .line 49
    goto/16 :goto_3

    .line 50
    .line 51
    :cond_1
    iget-object v4, v3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 52
    .line 53
    const-string v5, "male"

    .line 54
    .line 55
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    const-string v4, "\u4ed6"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const-string v4, "\u5979"

    .line 65
    .line 66
    :goto_0
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    const/4 v6, 0x3

    .line 73
    const/4 v7, 0x2

    .line 74
    const/4 v8, 0x4

    .line 75
    const/4 v9, 0x1

    .line 76
    const/4 v10, 0x0

    .line 77
    if-nez v5, :cond_3

    .line 78
    .line 79
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-lt v5, v8, :cond_3

    .line 86
    .line 87
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->l:Lv/VLinear;

    .line 88
    .line 89
    invoke-static {v5, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 93
    .line 94
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->m:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {v3, v9}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 97
    .line 98
    .line 99
    move-result-object v12

    .line 100
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 101
    .line 102
    .line 103
    move-result-object v12

    .line 104
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 105
    .line 106
    .line 107
    move-result-object v12

    .line 108
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v12

    .line 112
    invoke-virtual {v5, v11, v12}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->n:Lv/VDraweeView;

    .line 118
    .line 119
    invoke-virtual {v3, v7}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 120
    .line 121
    .line 122
    move-result-object v12

    .line 123
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 124
    .line 125
    .line 126
    move-result-object v12

    .line 127
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 128
    .line 129
    .line 130
    move-result-object v12

    .line 131
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v12

    .line 135
    invoke-virtual {v5, v11, v12}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 139
    .line 140
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->o:Lv/VDraweeView;

    .line 141
    .line 142
    invoke-virtual {v3, v6}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 143
    .line 144
    .line 145
    move-result-object v12

    .line 146
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 147
    .line 148
    .line 149
    move-result-object v12

    .line 150
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 151
    .line 152
    .line 153
    move-result-object v12

    .line 154
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v12

    .line 158
    invoke-virtual {v5, v11, v12}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->j:Lv/VText;

    .line 162
    .line 163
    const-string v11, "\u6700\u8fd1\u7684\u52a8\u6001\u7167\u7247"

    .line 164
    .line 165
    invoke-virtual {v4, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v11

    .line 169
    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->j:Lv/VText;

    .line 173
    .line 174
    invoke-static {v5, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 178
    .line 179
    invoke-static {v5, v10}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->l:Lv/VLinear;

    .line 183
    .line 184
    invoke-static {v5, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 185
    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_3
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->l:Lv/VLinear;

    .line 189
    .line 190
    invoke-static {v5, v10}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    new-instance v11, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView$a;

    .line 198
    .line 199
    invoke-direct {v11, v0, v3}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView$a;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;)V

    .line 200
    .line 201
    .line 202
    invoke-static {v5, v3, v11}, Ll/nnm;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 203
    .line 204
    .line 205
    :goto_1
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 206
    .line 207
    invoke-virtual {v3, v10}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 208
    .line 209
    .line 210
    move-result-object v11

    .line 211
    invoke-virtual {v5, v11, v10}, Lcom/p1/mobile/putong/core/ui/PictureView;->c0(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 212
    .line 213
    .line 214
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->f:Lv/VText;

    .line 215
    .line 216
    sget-object v11, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 217
    .line 218
    sget v12, Ll/dbc0;->Y3:I

    .line 219
    .line 220
    invoke-virtual {v11, v12}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 221
    .line 222
    .line 223
    move-result-object v11

    .line 224
    invoke-virtual {v5, v11}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 225
    .line 226
    .line 227
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->f:Lv/VText;

    .line 228
    .line 229
    const-string v11, "\u5fc3\u52a8\u5339\u914d"

    .line 230
    .line 231
    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    new-instance v5, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string v11, "\u70b9\u51fb\u548c"

    .line 237
    .line 238
    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v4, "\u804a\u4e00\u804a"

    .line 245
    .line 246
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->q:Lv/VText;

    .line 254
    .line 255
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    sget v5, Ll/dbc0;->W3:I

    .line 263
    .line 264
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 273
    .line 274
    .line 275
    move-result v11

    .line 276
    invoke-virtual {v4, v10, v10, v5, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 277
    .line 278
    .line 279
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->f:Lv/VText;

    .line 280
    .line 281
    const/4 v11, 0x0

    .line 282
    invoke-virtual {v5, v4, v11, v11, v11}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 283
    .line 284
    .line 285
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 286
    .line 287
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 288
    .line 289
    invoke-static {v3}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 290
    .line 291
    .line 292
    move-result-wide v11

    .line 293
    long-to-double v11, v11

    .line 294
    invoke-virtual {v4, v3, v11, v12}, Lcom/p1/mobile/putong/core/api/f;->i3(Lcom/p1/mobile/putong/data/User;D)Z

    .line 295
    .line 296
    .line 297
    move-result v4

    .line 298
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->h:Lv/VText;

    .line 299
    .line 300
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 301
    .line 302
    .line 303
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->i:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 304
    .line 305
    invoke-virtual {v4, v3, v10, v9, v9}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->q(Lcom/p1/mobile/putong/data/User;IZZ)V

    .line 306
    .line 307
    .line 308
    invoke-static {}, Ll/gra;->C2()Z

    .line 309
    .line 310
    .line 311
    move-result v4

    .line 312
    const/4 v11, 0x6

    .line 313
    const/4 v12, 0x5

    .line 314
    const/16 v13, 0x8

    .line 315
    .line 316
    const/4 v14, 0x0

    .line 317
    if-eqz v4, :cond_5

    .line 318
    .line 319
    sget v4, Ll/qa00;->o:I

    .line 320
    .line 321
    int-to-float v15, v4

    .line 322
    const/16 p3, 0x7

    .line 323
    .line 324
    int-to-float v5, v4

    .line 325
    move/from16 v16, v6

    .line 326
    .line 327
    int-to-float v6, v4

    .line 328
    int-to-float v4, v4

    .line 329
    move/from16 v17, v7

    .line 330
    .line 331
    new-array v7, v13, [F

    .line 332
    .line 333
    aput v14, v7, v10

    .line 334
    .line 335
    aput v14, v7, v9

    .line 336
    .line 337
    aput v14, v7, v17

    .line 338
    .line 339
    aput v14, v7, v16

    .line 340
    .line 341
    aput v15, v7, v8

    .line 342
    .line 343
    aput v5, v7, v12

    .line 344
    .line 345
    aput v6, v7, v11

    .line 346
    .line 347
    aput v4, v7, p3

    .line 348
    .line 349
    const v4, -0xfcfcfd

    .line 350
    .line 351
    .line 352
    invoke-static {v4, v7}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 357
    .line 358
    .line 359
    move-result v6

    .line 360
    if-eqz v6, :cond_4

    .line 361
    .line 362
    new-array v5, v13, [F

    .line 363
    .line 364
    fill-array-data v5, :array_0

    .line 365
    .line 366
    .line 367
    invoke-static {v4, v5}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 368
    .line 369
    .line 370
    move-result-object v5

    .line 371
    :cond_4
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->d:Landroid/view/View;

    .line 372
    .line 373
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 374
    .line 375
    .line 376
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->c:Landroid/view/View;

    .line 377
    .line 378
    const/high16 v5, 0x42ce0000    # 103.0f

    .line 379
    .line 380
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 381
    .line 382
    .line 383
    move-result v5

    .line 384
    invoke-static {v4, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 385
    .line 386
    .line 387
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->c:Landroid/view/View;

    .line 388
    .line 389
    sget v5, Ll/dbc0;->Y1:I

    .line 390
    .line 391
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 392
    .line 393
    .line 394
    goto :goto_2

    .line 395
    :cond_5
    move/from16 v16, v6

    .line 396
    .line 397
    move/from16 v17, v7

    .line 398
    .line 399
    const/16 p3, 0x7

    .line 400
    .line 401
    sget v4, Ll/qa00;->o:I

    .line 402
    .line 403
    int-to-float v5, v4

    .line 404
    int-to-float v6, v4

    .line 405
    int-to-float v7, v4

    .line 406
    int-to-float v4, v4

    .line 407
    new-array v13, v13, [F

    .line 408
    .line 409
    aput v14, v13, v10

    .line 410
    .line 411
    aput v14, v13, v9

    .line 412
    .line 413
    aput v14, v13, v17

    .line 414
    .line 415
    aput v14, v13, v16

    .line 416
    .line 417
    aput v5, v13, v8

    .line 418
    .line 419
    aput v6, v13, v12

    .line 420
    .line 421
    aput v7, v13, v11

    .line 422
    .line 423
    aput v4, v13, p3

    .line 424
    .line 425
    const v4, -0xd2d2d3

    .line 426
    .line 427
    .line 428
    invoke-static {v4, v13}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 429
    .line 430
    .line 431
    move-result-object v4

    .line 432
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->d:Landroid/view/View;

    .line 433
    .line 434
    invoke-virtual {v5, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 435
    .line 436
    .line 437
    :goto_2
    invoke-static {}, Ll/nrb0;->b()Z

    .line 438
    .line 439
    .line 440
    move-result v4

    .line 441
    if-eqz v4, :cond_7

    .line 442
    .line 443
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->g:Lv/VLinear;

    .line 444
    .line 445
    invoke-static {v4, v10}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 446
    .line 447
    .line 448
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->g:Lv/VLinear;

    .line 449
    .line 450
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 451
    .line 452
    .line 453
    move-result v4

    .line 454
    if-lez v4, :cond_6

    .line 455
    .line 456
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->g:Lv/VLinear;

    .line 457
    .line 458
    sget v5, Ll/adc0;->X0:I

    .line 459
    .line 460
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 461
    .line 462
    .line 463
    move-result-object v4

    .line 464
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 465
    .line 466
    .line 467
    move-result v5

    .line 468
    if-eqz v5, :cond_6

    .line 469
    .line 470
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->g:Lv/VLinear;

    .line 471
    .line 472
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 473
    .line 474
    .line 475
    :cond_6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    sget-object v5, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->CARD:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 480
    .line 481
    invoke-static {v4, v3, v5}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 482
    .line 483
    .line 484
    move-result-object v4

    .line 485
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->g:Lv/VLinear;

    .line 486
    .line 487
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result v6

    .line 491
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 492
    .line 493
    .line 494
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 495
    .line 496
    .line 497
    move-result v5

    .line 498
    if-eqz v5, :cond_7

    .line 499
    .line 500
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->g:Lv/VLinear;

    .line 501
    .line 502
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 503
    .line 504
    .line 505
    :cond_7
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 506
    .line 507
    new-instance v5, Ll/tnm;

    .line 508
    .line 509
    invoke-direct {v5, v0}, Ll/tnm;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;)V

    .line 510
    .line 511
    .line 512
    invoke-static {v4, v5}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 513
    .line 514
    .line 515
    invoke-static {}, Ll/pzi0;->o()J

    .line 516
    .line 517
    .line 518
    move-result-wide v4

    .line 519
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->w(J)V

    .line 520
    .line 521
    .line 522
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 523
    .line 524
    new-instance v5, Ll/unm;

    .line 525
    .line 526
    invoke-direct {v5, v0, v3}, Ll/unm;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;)V

    .line 527
    .line 528
    .line 529
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 530
    .line 531
    .line 532
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->q:Lv/VText;

    .line 533
    .line 534
    new-instance v5, Ll/vnm;

    .line 535
    .line 536
    invoke-direct {v5, v0, v3, v1, v2}, Ll/vnm;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;)V

    .line 537
    .line 538
    .line 539
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 540
    .line 541
    .line 542
    :cond_8
    :goto_3
    return-void

    .line 543
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public w(J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/upm;->Z(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v0, 0x1

    .line 11
    .line 12
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/wnm;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2}, Ll/wnm;-><init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;J)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    .line 46
    .line 47
    return-void
.end method

.method public x()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/upm;->E(Lcom/p1/mobile/android/app/Act;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->n(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
