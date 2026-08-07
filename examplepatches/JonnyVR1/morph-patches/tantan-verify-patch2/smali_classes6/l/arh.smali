.class public Ll/arh;
.super Ll/fph;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/arh$a;
    }
.end annotation


# static fields
.field public static Q:Ljava/lang/String; = "p_poi_lighten_state_pop"


# instance fields
.field public L:Lcom/p1/mobile/putong/data/Emotion;

.field public M:Lcom/p1/mobile/putong/data/Emotion;

.field public N:Lcom/p1/mobile/putong/data/Emotion;

.field public O:Lcom/p1/mobile/putong/data/Emotion;

.field public P:Lcom/p1/mobile/putong/data/Emotion;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/fph;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Ll/arh;Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/arh;->u0(Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ll/arh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/arh;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Ll/arh;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/arh;->s0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Ll/arh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/arh;->x0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/arh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/arh;->y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o0(Ll/arh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/arh;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/arh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/arh;->w0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic s0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/arh;->q0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/arh;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/fph;->u:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/fph;->u:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    move-object v1, p1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Ll/fph;->H:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const-string p0, "\u8bf7\u8f93\u5165\u60a8\u6b64\u523b\u7684\u60f3\u6cd5"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object p1, p0, Ll/fph;->H:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/arh;->q0(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/arh;->dismiss()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    const-string p1, "moment"

    .line 57
    .line 58
    invoke-static {p1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    new-instance v5, Ll/zqh;

    .line 63
    .line 64
    invoke-direct {v5, p0, v1}, Ll/zqh;-><init>(Ll/arh;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const-string v3, "moment"

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    move-object v0, p0

    .line 71
    invoke-virtual/range {v0 .. v5}, Ll/fph;->G(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public final A0(Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x1e

    .line 17
    .line 18
    if-le v1, v2, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    :cond_0
    iput-object p2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 28
    .line 29
    new-instance p2, Lcom/p1/mobile/putong/data/TextTheme;

    .line 30
    .line 31
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 35
    .line 36
    iput-object v1, p2, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 39
    .line 40
    iput-object p1, p2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 41
    .line 42
    iput-object p2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/arh;->J()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, v0, p0}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public B0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x4

    .line 20
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Ll/fph;->h:Lv/VLinear;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/bnl0;->y0()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    sget v2, Ll/qa00;->y:I

    .line 34
    .line 35
    sub-int/2addr v0, v2

    .line 36
    sub-int/2addr v0, v2

    .line 37
    sget v2, Ll/qa00;->h:I

    .line 38
    .line 39
    mul-int/lit8 v2, v2, 0x3

    .line 40
    .line 41
    sub-int/2addr v0, v2

    .line 42
    div-int/2addr v0, v1

    .line 43
    iget-object v1, p0, Ll/fph;->i:Lv/VLinear;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 50
    .line 51
    iget-object v2, p0, Ll/fph;->i:Lv/VLinear;

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/fph;->l:Lv/VLinear;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 63
    .line 64
    iget-object v2, p0, Ll/fph;->l:Lv/VLinear;

    .line 65
    .line 66
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Ll/fph;->o:Lv/VLinear;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 76
    .line 77
    iget-object v2, p0, Ll/fph;->o:Lv/VLinear;

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/fph;->r:Lv/VLinear;

    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 89
    .line 90
    iget-object v0, p0, Ll/fph;->r:Lv/VLinear;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/arh;->r0()V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/fph;->i:Lv/VLinear;

    .line 99
    .line 100
    new-instance v1, Ll/vqh;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/vqh;-><init>(Ll/arh;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/fph;->l:Lv/VLinear;

    .line 109
    .line 110
    new-instance v1, Ll/wqh;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/wqh;-><init>(Ll/arh;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/fph;->o:Lv/VLinear;

    .line 119
    .line 120
    new-instance v1, Ll/xqh;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/xqh;-><init>(Ll/arh;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/fph;->r:Lv/VLinear;

    .line 129
    .line 130
    new-instance v1, Ll/yqh;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/yqh;-><init>(Ll/arh;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/fph;->h:Lv/VLinear;

    .line 140
    .line 141
    const/4 v0, 0x0

    .line 142
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public J()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/arh;->Q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public R()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/arh;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fph;->w:Landroid/widget/TextView;

    .line 5
    .line 6
    new-instance v1, Ll/tqh;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/tqh;-><init>(Ll/arh;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 11
    .line 12
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/fph;->H:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Ll/fph;->u:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 34
    .line 35
    new-instance v1, Ll/uqh;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/uqh;-><init>(Ll/arh;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->guide:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->guide:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 65
    .line 66
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Ll/fph;->H:Ljava/lang/String;

    .line 75
    .line 76
    iget-object p0, p0, Ll/fph;->u:Lv/VEditText;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    return-void
.end method

.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fph;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/arh;->J()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v1, p0, Ll/fph;->F:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v1, "poi_lighten_guide"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v1, "poi_lighten_click"

    .line 21
    .line 22
    :goto_0
    const-string v2, "source_page"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    filled-new-array {v1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "e_set_my_state_post"

    .line 33
    .line 34
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/arh;->A0(Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-virtual {p0, p1}, Ll/fph;->H(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final r0()V
    .locals 8

    .line 1
    sget-object v0, Ll/owi;->g:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/fph;->h:Lv/VLinear;

    .line 17
    .line 18
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    :goto_0
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/fph;->h:Lv/VLinear;

    .line 41
    .line 42
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v3, 0x1

    .line 55
    if-eqz v1, :cond_7

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_2

    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Lcom/p1/mobile/putong/data/Emotion;

    .line 80
    .line 81
    iget-object v5, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 82
    .line 83
    if-nez v5, :cond_4

    .line 84
    .line 85
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v6, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 88
    .line 89
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    check-cast v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;

    .line 96
    .line 97
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->emotionId:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    if-eqz v5, :cond_4

    .line 104
    .line 105
    iput-object v4, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 106
    .line 107
    :cond_4
    iget-object v5, p0, Ll/arh;->N:Lcom/p1/mobile/putong/data/Emotion;

    .line 108
    .line 109
    if-nez v5, :cond_5

    .line 110
    .line 111
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 112
    .line 113
    iget-object v6, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 114
    .line 115
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    check-cast v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;

    .line 122
    .line 123
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->emotionId:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz v5, :cond_5

    .line 130
    .line 131
    iput-object v4, p0, Ll/arh;->N:Lcom/p1/mobile/putong/data/Emotion;

    .line 132
    .line 133
    :cond_5
    iget-object v5, p0, Ll/arh;->O:Lcom/p1/mobile/putong/data/Emotion;

    .line 134
    .line 135
    if-nez v5, :cond_6

    .line 136
    .line 137
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v6, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 140
    .line 141
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 142
    .line 143
    const/4 v7, 0x2

    .line 144
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    check-cast v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;

    .line 149
    .line 150
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->emotionId:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-eqz v5, :cond_6

    .line 157
    .line 158
    iput-object v4, p0, Ll/arh;->O:Lcom/p1/mobile/putong/data/Emotion;

    .line 159
    .line 160
    :cond_6
    iget-object v5, p0, Ll/arh;->P:Lcom/p1/mobile/putong/data/Emotion;

    .line 161
    .line 162
    if-nez v5, :cond_3

    .line 163
    .line 164
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 165
    .line 166
    iget-object v6, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 167
    .line 168
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionGuides:Ljava/util/List;

    .line 169
    .line 170
    const/4 v7, 0x3

    .line 171
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    check-cast v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;

    .line 176
    .line 177
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->emotionId:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-eqz v5, :cond_3

    .line 184
    .line 185
    iput-object v4, p0, Ll/arh;->P:Lcom/p1/mobile/putong/data/Emotion;

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_7
    iget-object v0, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 189
    .line 190
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    const/high16 v1, 0x42500000    # 52.0f

    .line 195
    .line 196
    if-eqz v0, :cond_8

    .line 197
    .line 198
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 199
    .line 200
    iget-object v2, p0, Ll/fph;->j:Lv/VDraweeView;

    .line 201
    .line 202
    iget-object v4, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 203
    .line 204
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    invoke-virtual {v0, v2, v4, v5, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ll/fph;->k:Landroid/widget/TextView;

    .line 218
    .line 219
    iget-object v2, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 220
    .line 221
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 227
    .line 228
    iput-object v0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 229
    .line 230
    iget-object v0, p0, Ll/fph;->i:Lv/VLinear;

    .line 231
    .line 232
    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Ll/arh;->d0()V

    .line 236
    .line 237
    .line 238
    :cond_8
    iget-object v0, p0, Ll/arh;->N:Lcom/p1/mobile/putong/data/Emotion;

    .line 239
    .line 240
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-eqz v0, :cond_9

    .line 245
    .line 246
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 247
    .line 248
    iget-object v2, p0, Ll/fph;->m:Lv/VDraweeView;

    .line 249
    .line 250
    iget-object v3, p0, Ll/arh;->N:Lcom/p1/mobile/putong/data/Emotion;

    .line 251
    .line 252
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 253
    .line 254
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    invoke-virtual {v0, v2, v3, v4, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Ll/fph;->n:Landroid/widget/TextView;

    .line 266
    .line 267
    iget-object v2, p0, Ll/arh;->N:Lcom/p1/mobile/putong/data/Emotion;

    .line 268
    .line 269
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    :cond_9
    iget-object v0, p0, Ll/arh;->O:Lcom/p1/mobile/putong/data/Emotion;

    .line 275
    .line 276
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-eqz v0, :cond_a

    .line 281
    .line 282
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 283
    .line 284
    iget-object v2, p0, Ll/fph;->p:Lv/VDraweeView;

    .line 285
    .line 286
    iget-object v3, p0, Ll/arh;->O:Lcom/p1/mobile/putong/data/Emotion;

    .line 287
    .line 288
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 289
    .line 290
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 291
    .line 292
    .line 293
    move-result v4

    .line 294
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 295
    .line 296
    .line 297
    move-result v5

    .line 298
    invoke-virtual {v0, v2, v3, v4, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Ll/fph;->q:Landroid/widget/TextView;

    .line 302
    .line 303
    iget-object v2, p0, Ll/arh;->O:Lcom/p1/mobile/putong/data/Emotion;

    .line 304
    .line 305
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    .line 309
    .line 310
    :cond_a
    iget-object v0, p0, Ll/arh;->P:Lcom/p1/mobile/putong/data/Emotion;

    .line 311
    .line 312
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-eqz v0, :cond_b

    .line 317
    .line 318
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 319
    .line 320
    iget-object v2, p0, Ll/fph;->s:Lv/VDraweeView;

    .line 321
    .line 322
    iget-object v3, p0, Ll/arh;->P:Lcom/p1/mobile/putong/data/Emotion;

    .line 323
    .line 324
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 325
    .line 326
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 327
    .line 328
    .line 329
    move-result v4

    .line 330
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    invoke-virtual {v0, v2, v3, v4, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 335
    .line 336
    .line 337
    iget-object v0, p0, Ll/fph;->t:Landroid/widget/TextView;

    .line 338
    .line 339
    iget-object p0, p0, Ll/arh;->P:Lcom/p1/mobile/putong/data/Emotion;

    .line 340
    .line 341
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    .line 345
    .line 346
    :cond_b
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fph;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PoiEmotionGuide;->emotionId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fph;->i:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/fph;->i:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/fph;->l:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/fph;->o:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/fph;->r:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/fph;->i:Lv/VLinear;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/arh;->M:Lcom/p1/mobile/putong/data/Emotion;

    .line 41
    .line 42
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 43
    .line 44
    :goto_0
    invoke-virtual {p0}, Ll/arh;->z0()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/arh;->d0()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic w0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fph;->l:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/fph;->l:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/fph;->i:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/fph;->o:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/fph;->r:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/fph;->l:Lv/VLinear;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/arh;->N:Lcom/p1/mobile/putong/data/Emotion;

    .line 41
    .line 42
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 43
    .line 44
    :goto_0
    invoke-virtual {p0}, Ll/arh;->z0()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/arh;->d0()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic x0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fph;->o:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/fph;->o:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/fph;->l:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/fph;->i:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/fph;->r:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/fph;->o:Lv/VLinear;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/arh;->O:Lcom/p1/mobile/putong/data/Emotion;

    .line 41
    .line 42
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 43
    .line 44
    :goto_0
    invoke-virtual {p0}, Ll/arh;->z0()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/arh;->d0()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic y0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fph;->r:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/fph;->r:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/fph;->l:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/fph;->o:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/fph;->i:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/fph;->r:Lv/VLinear;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/arh;->P:Lcom/p1/mobile/putong/data/Emotion;

    .line 41
    .line 42
    iput-object p1, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 43
    .line 44
    :goto_0
    invoke-virtual {p0}, Ll/arh;->z0()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/arh;->d0()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final z0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/arh;->J()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/arh;->L:Lcom/p1/mobile/putong/data/Emotion;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "state_type_id"

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "e_set_my_state_type"

    .line 25
    .line 26
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
