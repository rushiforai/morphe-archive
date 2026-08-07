.class public Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/eat;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VImage;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/Animator;

.field public j:Landroid/animation/Animator;

.field public k:Ll/eat;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->n(Ll/x20;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->k()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->m()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->l()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Ll/x20;Landroid/view/animation/LinearInterpolator;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->j(Ll/x20;Landroid/view/animation/LinearInterpolator;Ll/x20;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->h:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->i:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->j:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yf50;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ll/eat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->k:Ll/eat;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eat;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->i(Ll/eat;)V

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

.method public final synthetic j(Ll/x20;Landroid/view/animation/LinearInterpolator;Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->s(Landroid/view/animation/LinearInterpolator;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic l()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, "\u672c\u573a\u4e3b\u64ad\u51c6\u5907\u4e2d"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->g:Landroid/widget/TextView;

    .line 9
    .line 10
    const-string v0, "\u656c\u8bf7\u671f\u5f85"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic n(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Ll/x20;Ll/x20;)V
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->f:Landroid/widget/TextView;

    .line 6
    .line 7
    const-string v2, "\u5f53\u524d\u4e3b\u64ad\u5df2\u7ed3\u675f\u6f14\u51fa"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->g:Landroid/widget/TextView;

    .line 13
    .line 14
    const-string v2, "\u4e0b\u4e00\u4f4d\u4e3b\u64ad\u5373\u5c06\u5f00\u59cb"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    const-string v1, "context_single_room"

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->b:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v2, p1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    if-eqz p2, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->e:Lv/VDraweeView;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1, p1, p2}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/4 p1, 0x0

    .line 40
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->a:Lv/VLinear;

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->c:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->b:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 57
    .line 58
    .line 59
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 60
    .line 61
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 62
    .line 63
    .line 64
    const/4 p2, 0x2

    .line 65
    new-array v9, p2, [F

    .line 66
    .line 67
    fill-array-data v9, :array_0

    .line 68
    .line 69
    .line 70
    const-string v3, "alpha"

    .line 71
    .line 72
    const-wide/16 v4, 0x0

    .line 73
    .line 74
    const-wide/16 v6, 0x14d

    .line 75
    .line 76
    move-object v2, p0

    .line 77
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    move-object v10, v2

    .line 82
    iget-object v2, v10, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->a:Lv/VLinear;

    .line 83
    .line 84
    sget v3, Ll/qa00;->t:I

    .line 85
    .line 86
    int-to-float v3, v3

    .line 87
    new-array v9, p2, [F

    .line 88
    .line 89
    aput v3, v9, v1

    .line 90
    .line 91
    aput p1, v9, v0

    .line 92
    .line 93
    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 94
    .line 95
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v2, v10, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->a:Lv/VLinear;

    .line 100
    .line 101
    new-array v9, p2, [F

    .line 102
    .line 103
    fill-array-data v9, :array_1

    .line 104
    .line 105
    .line 106
    const-string v3, "alpha"

    .line 107
    .line 108
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    filled-new-array {p1, p2}, [Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iput-object p0, v10, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->i:Landroid/animation/Animator;

    .line 129
    .line 130
    new-instance p1, Ll/uf50;

    .line 131
    .line 132
    invoke-direct {p1, v10, p3, v8, p4}, Ll/uf50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Ll/x20;Landroid/view/animation/LinearInterpolator;Ll/x20;)V

    .line 133
    .line 134
    .line 135
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    iget-object p0, v10, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->i:Landroid/animation/Animator;

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    nop

    .line 145
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public q(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V
    .locals 12

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->f:Landroid/widget/TextView;

    .line 6
    .line 7
    const-string v2, "\u672c\u573a\u4e3b\u64ad\u51c6\u5907\u4e2d"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->g:Landroid/widget/TextView;

    .line 13
    .line 14
    const-string v2, "\u656c\u8bf7\u671f\u5f85"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->e:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "context_single_room"

    .line 26
    .line 27
    invoke-static {v2, v1, p1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->a:Lv/VLinear;

    .line 35
    .line 36
    invoke-virtual {v1, p1}, Landroid/view/View;->setAlpha(F)V

    .line 37
    .line 38
    .line 39
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 40
    .line 41
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x2

    .line 45
    new-array v9, v1, [F

    .line 46
    .line 47
    fill-array-data v9, :array_0

    .line 48
    .line 49
    .line 50
    const-string v3, "alpha"

    .line 51
    .line 52
    const-wide/16 v4, 0x0

    .line 53
    .line 54
    const-wide/16 v6, 0x14a

    .line 55
    .line 56
    move-object v2, p0

    .line 57
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    move-object v10, v2

    .line 62
    iget-object v2, v10, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->a:Lv/VLinear;

    .line 63
    .line 64
    sget v3, Ll/qa00;->t:I

    .line 65
    .line 66
    int-to-float v3, v3

    .line 67
    new-array v9, v1, [F

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    aput v3, v9, v4

    .line 71
    .line 72
    aput p1, v9, v0

    .line 73
    .line 74
    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 75
    .line 76
    const-wide/16 v4, 0x0

    .line 77
    .line 78
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v2, v10, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->a:Lv/VLinear;

    .line 83
    .line 84
    new-array v9, v1, [F

    .line 85
    .line 86
    fill-array-data v9, :array_1

    .line 87
    .line 88
    .line 89
    const-string v3, "alpha"

    .line 90
    .line 91
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-array v9, v1, [F

    .line 96
    .line 97
    fill-array-data v9, :array_2

    .line 98
    .line 99
    .line 100
    const-string v3, "alpha"

    .line 101
    .line 102
    const-wide/16 v6, 0x1f4

    .line 103
    .line 104
    move-object v2, v10

    .line 105
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    filled-new-array {p1, v0}, [Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object v4, v2, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->d:Lv/VImage;

    .line 118
    .line 119
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 120
    .line 121
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 122
    .line 123
    .line 124
    new-array v11, v1, [F

    .line 125
    .line 126
    fill-array-data v11, :array_3

    .line 127
    .line 128
    .line 129
    const-string v5, "rotation"

    .line 130
    .line 131
    const-wide/16 v6, 0x0

    .line 132
    .line 133
    const-wide/16 v8, 0x7d0

    .line 134
    .line 135
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    filled-new-array {p0, p1, v0, v3}, [Landroid/animation/Animator;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iput-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->h:Landroid/animation/Animator;

    .line 148
    .line 149
    new-instance p1, Ll/tf50;

    .line 150
    .line 151
    invoke-direct {p1, v2}, Ll/tf50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->h:Landroid/animation/Animator;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    :array_3
    .array-data 4
        0x0
        0x44340000    # 720.0f
    .end array-data
.end method

.method public final s(Landroid/view/animation/LinearInterpolator;Ll/x20;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    neg-int v2, v2

    .line 10
    int-to-float v2, v2

    .line 11
    const/4 v9, 0x2

    .line 12
    new-array v8, v9, [F

    .line 13
    .line 14
    const/4 v10, 0x0

    .line 15
    const/4 v11, 0x0

    .line 16
    aput v11, v8, v10

    .line 17
    .line 18
    const/4 v12, 0x1

    .line 19
    aput v2, v8, v12

    .line 20
    .line 21
    sget-object v14, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    const-wide/16 v5, 0x1f4

    .line 26
    .line 27
    move-object/from16 v7, p1

    .line 28
    .line 29
    move-object v2, v14

    .line 30
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->c:Landroid/widget/FrameLayout;

    .line 35
    .line 36
    invoke-static {}, Ll/bnl0;->y0()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-float v1, v1

    .line 41
    new-array v2, v9, [F

    .line 42
    .line 43
    aput v1, v2, v10

    .line 44
    .line 45
    aput v11, v2, v12

    .line 46
    .line 47
    const-wide/16 v15, 0x0

    .line 48
    .line 49
    const-wide/16 v17, 0x1f4

    .line 50
    .line 51
    move-object/from16 v19, p1

    .line 52
    .line 53
    move-object/from16 v20, v2

    .line 54
    .line 55
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    new-instance v1, Ll/vf50;

    .line 60
    .line 61
    invoke-direct {v1, v0}, Ll/vf50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v10, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    const/16 v1, 0xfa

    .line 68
    .line 69
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v11

    .line 73
    new-instance v1, Ll/wf50;

    .line 74
    .line 75
    invoke-direct {v1, v0}, Ll/wf50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v11, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    new-array v7, v9, [F

    .line 82
    .line 83
    fill-array-data v7, :array_0

    .line 84
    .line 85
    .line 86
    const-string v1, "alpha"

    .line 87
    .line 88
    const-wide/16 v2, 0x0

    .line 89
    .line 90
    const-wide/16 v4, 0x1f4

    .line 91
    .line 92
    move-object/from16 v6, p1

    .line 93
    .line 94
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const/16 v2, 0x535

    .line 99
    .line 100
    invoke-static {v2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iget-object v12, v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->d:Lv/VImage;

    .line 105
    .line 106
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 107
    .line 108
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 109
    .line 110
    .line 111
    new-array v3, v9, [F

    .line 112
    .line 113
    fill-array-data v3, :array_1

    .line 114
    .line 115
    .line 116
    const-string v13, "rotation"

    .line 117
    .line 118
    const-wide/16 v14, 0x0

    .line 119
    .line 120
    const-wide/16 v16, 0x7d0

    .line 121
    .line 122
    move-object/from16 v19, v3

    .line 123
    .line 124
    invoke-static/range {v12 .. v19}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    filled-new-array {v8, v10, v11}, [Landroid/animation/Animator;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-static {v4}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    const/16 v5, 0x5dc

    .line 137
    .line 138
    invoke-static {v5}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    filled-new-array {v4, v5}, [Landroid/animation/Animator;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    invoke-static {v4}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    filled-new-array {v3, v4}, [Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    filled-new-array {v2, v3, v1}, [Landroid/animation/Animator;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-static {v1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->j:Landroid/animation/Animator;

    .line 167
    .line 168
    new-instance v2, Ll/xf50;

    .line 169
    .line 170
    move-object/from16 v3, p2

    .line 171
    .line 172
    invoke-direct {v2, v0, v3}, Ll/xf50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Ll/x20;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 176
    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->j:Landroid/animation/Animator;

    .line 179
    .line 180
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    nop

    .line 185
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :array_1
    .array-data 4
        0x0
        0x44340000    # 720.0f
    .end array-data
.end method
