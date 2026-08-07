.class public abstract Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/vdp0;",
        ">",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/scp0<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public d:Ll/scp0;

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

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
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

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
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    return-void
.end method

.method public static synthetic h0(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p2, v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x5

    .line 13
    if-eq p2, v1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 24
    .line 25
    sub-int/2addr p1, p0

    .line 26
    if-ne p1, v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic i0(ILl/vdp0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/vdp0;->setItemPlaceRes(I)V

    .line 2
    .line 3
    .line 4
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


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 14
    .line 15
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/vdp0;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/vdp0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public Q3(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/vdp0;

    .line 16
    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 20
    .line 21
    invoke-interface {v0, p1, p2, p0}, Ll/vdp0;->b(IZLl/scp0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->l0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->setVisible(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public abstract getDeputyViewList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation
.end method

.method public getPresenter()Ll/scp0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/scp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->k0(Ll/scp0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k0(Ll/scp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 2
    .line 3
    return-void
.end method

.method public final l0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->m0(I)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method public m0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/vdp0;

    .line 16
    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 20
    .line 21
    invoke-interface {v0, p1, p0}, Ll/vdp0;->f(ILl/scp0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public n0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->getDeputyViewList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public o0(Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V
    .locals 7

    .line 1
    if-ltz p2, :cond_3

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-lt p2, p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/vdp0;

    .line 20
    .line 21
    if-eqz p1, :cond_3

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Ll/yec0;->ga:I

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    move-object v1, v0

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    new-instance v6, Ll/dt2;

    .line 72
    .line 73
    invoke-direct {v6}, Ll/dt2;-><init>()V

    .line 74
    .line 75
    .line 76
    move-object v2, p3

    .line 77
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 78
    .line 79
    .line 80
    new-instance p3, Lcom/p1/mobile/android/ui/bubble/a;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-direct {p3, p0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    sget p0, Ll/qa00;->c:I

    .line 90
    .line 91
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const/16 v0, 0x4b

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget v0, Ll/qa00;->z:I

    .line 106
    .line 107
    neg-int v0, v0

    .line 108
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    sget v0, Ll/n9c0;->e1:I

    .line 113
    .line 114
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    filled-new-array {v0}, [I

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    const-wide/16 v0, 0x1388

    .line 133
    .line 134
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 135
    .line 136
    .line 137
    const/4 p0, 0x1

    .line 138
    if-eq p2, p0, :cond_2

    .line 139
    .line 140
    const/16 p0, 0x8

    .line 141
    .line 142
    if-eq p2, p0, :cond_1

    .line 143
    .line 144
    const/4 p0, 0x4

    .line 145
    if-eq p2, p0, :cond_1

    .line 146
    .line 147
    const/4 p0, 0x5

    .line 148
    if-eq p2, p0, :cond_2

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    sget p0, Ll/qa00;->i:I

    .line 152
    .line 153
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 154
    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_2
    sget p0, Ll/qa00;->i:I

    .line 158
    .line 159
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 160
    .line 161
    .line 162
    :goto_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    check-cast p1, Landroid/view/View;

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetViewTag()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    :cond_3
    :goto_1
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/vdp0;

    .line 10
    .line 11
    invoke-interface {p0, p2}, Ll/vdp0;->d(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->m0(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/vdp0;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 22
    .line 23
    invoke-interface {v1, v0, v2}, Ll/vdp0;->e(ILl/scp0;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public setData(Ll/hrk0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/hrk0;->p()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->l0()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public setItemPlaceRes(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/bt2;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/bt2;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->setVisible(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ll/hrk0;->r()Ll/ado0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 18
    .line 19
    if-ltz v2, :cond_3

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-lt v2, v3, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->e:Ljava/util/List;

    .line 33
    .line 34
    iget v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 35
    .line 36
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ll/vdp0;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 43
    .line 44
    invoke-interface {v2, p2, v1, v0, v3}, Ll/vdp0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ll/nsv;Ll/scp0;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->callConnections:Ljava/util/List;

    .line 48
    .line 49
    new-instance v1, Ll/ct2;

    .line 50
    .line 51
    invoke-direct {v1, p1, p2}, Ll/ct2;-><init>(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;

    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->horizontalEffectSvga:Ljava/lang/String;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const-string p1, ""

    .line 66
    .line 67
    :goto_0
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void

    .line 71
    :cond_3
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string p1, "illegal call,id="

    .line 74
    .line 75
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p1, ",position:"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "[voice][call]"

    .line 98
    .line 99
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method
