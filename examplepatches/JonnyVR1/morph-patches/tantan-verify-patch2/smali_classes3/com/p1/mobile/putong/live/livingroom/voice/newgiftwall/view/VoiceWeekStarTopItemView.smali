.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->m0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->l0(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->n0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic l0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->e:Ljava/lang/String;

    .line 3
    .line 4
    return-void
.end method

.method public final n0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/zvk;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v1, v2}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->d:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/16 v2, 0xd

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/zvk;->t(I)Ll/zvk;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-virtual {v1, v2}, Ll/zvk;->c(Z)Ll/zvk;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "#FE7E1D"

    .line 49
    .line 50
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    filled-new-array {v2}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ll/zvk;->e([I)Ll/zvk;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x0

    .line 63
    invoke-virtual {v1, v2}, Ll/zvk;->v(Z)Ll/zvk;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Ll/qa00;->m:I

    .line 68
    .line 69
    sget v3, Ll/qa00;->i:I

    .line 70
    .line 71
    invoke-virtual {v1, v2, v3, v2, v3}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const-wide/16 v2, 0xbb8

    .line 76
    .line 77
    invoke-virtual {v1, v2, v3}, Ll/zvk;->a(J)Ll/zvk;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget v2, Ll/zvk;->D:I

    .line 82
    .line 83
    sget v3, Ll/zvk;->C:I

    .line 84
    .line 85
    or-int/2addr v2, v3

    .line 86
    invoke-virtual {v1, v2}, Ll/zvk;->i(I)Ll/zvk;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const/high16 v2, 0x40e00000    # 7.0f

    .line 91
    .line 92
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {v1, v2}, Ll/zvk;->f(I)Ll/zvk;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ll/zlp0;

    .line 101
    .line 102
    invoke-direct {v2, p0}, Ll/zlp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v2, Ll/amp0;

    .line 110
    .line 111
    invoke-direct {v2, p0}, Ll/amp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v2}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->f:Landroid/view/View;

    .line 119
    .line 120
    invoke-virtual {v0, v1, v2}, Ll/fwk;->t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->e:Ljava/lang/String;

    .line 125
    .line 126
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->z5:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->f:Landroid/view/View;

    .line 11
    .line 12
    new-instance v1, Ll/ylp0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/ylp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setBubbleText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarTopItemView;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
