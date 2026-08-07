.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public f:Lv/VLinear;

.field public g:Lv/VFrame;

.field public h:Lv/VFrame;

.field public i:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:[Lv/VDraweeView;

.field public n:I

.field public o:Ll/kcg0;

.field public p:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x4

    .line 14
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x4

    .line 17
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;Ll/oql;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->X(Ll/oql;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->a0()V

    return-void
.end method

.method public static synthetic R(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->W(Ljava/lang/Long;)V

    return-void
.end method

.method private synthetic W(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b0()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->k:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    div-int/2addr v0, v1

    .line 9
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 10
    .line 11
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->k:Lv/VText;

    .line 15
    .line 16
    neg-int v3, v0

    .line 17
    int-to-float v3, v3

    .line 18
    new-array v9, v1, [F

    .line 19
    .line 20
    const/4 v10, 0x0

    .line 21
    const/4 v11, 0x0

    .line 22
    aput v11, v9, v10

    .line 23
    .line 24
    const/4 v12, 0x1

    .line 25
    aput v3, v9, v12

    .line 26
    .line 27
    const-string v3, "translationY"

    .line 28
    .line 29
    const-wide/16 v4, 0x0

    .line 30
    .line 31
    const-wide/16 v6, 0x64

    .line 32
    .line 33
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v13

    .line 37
    new-instance v2, Ll/oi4;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/oi4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v13, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->k:Lv/VText;

    .line 46
    .line 47
    int-to-float p0, v0

    .line 48
    new-array v9, v1, [F

    .line 49
    .line 50
    aput p0, v9, v10

    .line 51
    .line 52
    aput v11, v9, v12

    .line 53
    .line 54
    const-string v3, "translationY"

    .line 55
    .line 56
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    filled-new-array {v13, p0}, [Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private getParams()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/sfj0$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "anchorId"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->voiceLiveId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, ""

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->voiceLiveId:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move-object v1, v2

    .line 41
    :goto_0
    const-string v3, "liveId"

    .line 42
    .line 43
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->voiceRoomId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->voiceRoomId:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    move-object v1, v2

    .line 70
    :goto_1
    const-string v3, "roomId"

    .line 71
    .line 72
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    const-string v1, "audio_card_type"

    .line 80
    .line 81
    const-string v3, "swipe_card_voicechat"

    .line 82
    .line 83
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->anchorId:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_3

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceLiveState;->anchorId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_2

    .line 115
    .line 116
    const-string v2, "anchor"

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_2
    const-string v2, "audience_voicechat"

    .line 120
    .line 121
    :cond_3
    :goto_2
    const-string p0, "user_type"

    .line 122
    .line 123
    invoke-static {p0, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    const-string p0, "index"

    .line 131
    .line 132
    const/4 v1, 0x1

    .line 133
    invoke-static {p0, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    return-object v0
.end method


# virtual methods
.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pi4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final V()V
    .locals 8

    .line 1
    sget v0, Ll/kec0;->u0:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->avatars:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x4

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v3, 0x3

    .line 19
    const/4 v4, 0x2

    .line 20
    const/4 v5, 0x1

    .line 21
    if-eq v1, v5, :cond_3

    .line 22
    .line 23
    if-eq v1, v4, :cond_2

    .line 24
    .line 25
    if-eq v1, v3, :cond_1

    .line 26
    .line 27
    if-eq v1, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget v0, Ll/kec0;->t0:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget v0, Ll/kec0;->v0:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    sget v0, Ll/kec0;->w0:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    sget v0, Ll/kec0;->u0:I

    .line 40
    .line 41
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->h:Lv/VFrame;

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    invoke-virtual {v2, v0, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 57
    .line 58
    sget v6, Ll/adc0;->e6:I

    .line 59
    .line 60
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    check-cast v6, Lv/VDraweeView;

    .line 65
    .line 66
    aput-object v6, v2, v7

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 69
    .line 70
    sget v6, Ll/adc0;->h6:I

    .line 71
    .line 72
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    check-cast v6, Lv/VDraweeView;

    .line 77
    .line 78
    aput-object v6, v2, v5

    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 81
    .line 82
    sget v5, Ll/adc0;->g6:I

    .line 83
    .line 84
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Lv/VDraweeView;

    .line 89
    .line 90
    aput-object v5, v2, v4

    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 93
    .line 94
    sget v4, Ll/adc0;->c6:I

    .line 95
    .line 96
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Lv/VDraweeView;

    .line 101
    .line 102
    aput-object v4, v2, v3

    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->h:Lv/VFrame;

    .line 105
    .line 106
    invoke-virtual {v2, v0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    :goto_1
    if-ge v7, v1, :cond_6

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->avatars:Ljava/util/List;

    .line 116
    .line 117
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_4

    .line 122
    .line 123
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 126
    .line 127
    aget-object v2, v2, v7

    .line 128
    .line 129
    invoke-virtual {v0, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->avatars:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Ljava/lang/CharSequence;

    .line 144
    .line 145
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_5

    .line 150
    .line 151
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 152
    .line 153
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 154
    .line 155
    aget-object v2, v2, v7

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 162
    .line 163
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->m:[Lv/VDraweeView;

    .line 164
    .line 165
    aget-object v2, v2, v7

    .line 166
    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 168
    .line 169
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 170
    .line 171
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VoiceLiveState;->avatars:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    :goto_2
    add-int/lit8 v7, v7, 0x1

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_6
    return-void
.end method

.method public final synthetic X(Ll/oql;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p1}, Ll/oql;->f()Ll/t7m;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p2, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserVirtualVoiceId(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    const-string v3, "suggest-card"

    .line 43
    .line 44
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->getParams()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    new-array p1, p1, [Ll/sfj0$a;

    .line 56
    .line 57
    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, [Ll/sfj0$a;

    .line 62
    .line 63
    const-string p1, "e_live_audio_room_enter"

    .line 64
    .line 65
    const-string p2, "p_suggest_users_home_view"

    .line 66
    .line 67
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public Y(Ll/oql;Lcom/p1/mobile/putong/data/VoiceLiveState;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ll/oql;->g()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    if-nez p3, :cond_1

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->getParams()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    new-array p1, p1, [Ll/sfj0$a;

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, [Ll/sfj0$a;

    .line 47
    .line 48
    const-string p1, "e_live_audio_room_enter"

    .line 49
    .line 50
    const-string p2, "p_suggest_users_home_view"

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public Z(Ll/oql;)V
    .locals 5

    .line 1
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->V()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->i:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 27
    .line 28
    new-instance v1, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 29
    .line 30
    invoke-direct {v1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v2, "core_card_bottom_live.svga"

    .line 34
    .line 35
    const/4 v3, -0x1

    .line 36
    const/4 v4, 0x1

    .line 37
    invoke-virtual {v0, v2, v3, v1, v4}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->topDesc:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->title:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_0

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->j:Lv/VText;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "#"

    .line 69
    .line 70
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VoiceLiveState;->topDesc:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, " "

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 90
    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VoiceLiveState;->title:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_3

    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    const/4 v1, 0x0

    .line 126
    if-ne v0, v4, :cond_1

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->k:Lv/VText;

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 133
    .line 134
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    check-cast v1, Ljava/lang/CharSequence;

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-le v0, v4, :cond_3

    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->k:Lv/VText;

    .line 159
    .line 160
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 161
    .line 162
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 163
    .line 164
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 165
    .line 166
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    check-cast v1, Ljava/lang/CharSequence;

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->o:Ll/kcg0;

    .line 176
    .line 177
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_2

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->act()Lcom/p1/mobile/android/app/Act;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const-wide/16 v1, 0x7

    .line 189
    .line 190
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 191
    .line 192
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    new-instance v1, Ll/li4;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/li4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;)V

    .line 219
    .line 220
    .line 221
    new-instance v2, Ll/mi4;

    .line 222
    .line 223
    invoke-direct {v2}, Ll/mi4;-><init>()V

    .line 224
    .line 225
    .line 226
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->o:Ll/kcg0;

    .line 235
    .line 236
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->f:Lv/VLinear;

    .line 237
    .line 238
    new-instance v1, Ll/ni4;

    .line 239
    .line 240
    invoke-direct {v1, p0, p1}, Ll/ni4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;Ll/oql;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 244
    .line 245
    .line 246
    :cond_4
    :goto_1
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    .line 19
    .line 20
    if-ltz v0, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-lt v0, v1, :cond_2

    .line 33
    .line 34
    :cond_1
    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->k:Lv/VText;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->p:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceLiveState;->messages:Ljava/util/List;

    .line 44
    .line 45
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->n:I

    .line 46
    .line 47
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/CharSequence;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->o:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
