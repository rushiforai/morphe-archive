.class public Ll/vrr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grr;


# instance fields
.field public final a:Lv/VMarqueeText;

.field public final b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public final c:Lv/VText;

.field public final d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vrr;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->i:Lv/VMarqueeText;

    .line 7
    .line 8
    iput-object v0, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    iput-object v0, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->j:Lv/VText;

    .line 15
    .line 16
    iput-object p1, p0, Ll/vrr;->c:Lv/VText;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    const p0, -0x16300

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public b(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 8
    .line 9
    const/high16 v1, 0x41400000    # 12.0f

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->title:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->title:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 38
    .line 39
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 40
    .line 41
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->l:I

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :goto_1
    iget-object p1, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 51
    .line 52
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/mbs;->h()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object p2, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->setClearsAfterStop(Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 68
    .line 69
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 80
    .line 81
    sget p2, Ll/nbc0;->v:I

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 84
    .line 85
    .line 86
    sget p1, Ll/qa00;->q:I

    .line 87
    .line 88
    iget-object p2, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 89
    .line 90
    new-array v2, v0, [Landroid/view/View;

    .line 91
    .line 92
    aput-object p2, v2, v1

    .line 93
    .line 94
    invoke-static {p1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Ll/vrr;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 98
    .line 99
    invoke-static {p2, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_2
    const-string p1, "https://auto.tancdn.com/v1/raw/b416fad0-e6ba-491c-8051-182413da4aa511.so"

    .line 104
    .line 105
    const/4 v2, -0x1

    .line 106
    invoke-virtual {p2, p1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    :goto_2
    iget-object p1, p0, Ll/vrr;->c:Lv/VText;

    .line 110
    .line 111
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/vrr;->k()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget-object p0, p0, Ll/vrr;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 121
    .line 122
    new-array p2, v0, [Landroid/view/View;

    .line 123
    .line 124
    aput-object p0, p2, v1

    .line 125
    .line 126
    invoke-static {p1, p2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    const p0, -0x5a6c6

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public e()I
    .locals 1

    .line 1
    const/high16 v0, 0x42600000    # 56.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/vrr;->k()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public f()I
    .locals 0

    .line 1
    const/high16 p0, 0x422c0000    # 43.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/nbc0;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final k()I
    .locals 3

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-int/lit8 v1, v1, 0x4

    .line 8
    .line 9
    const/high16 v2, 0x42aa0000    # 85.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object p0, p0, Ll/vrr;->a:Lv/VMarqueeText;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    mul-int/2addr p0, v0

    .line 30
    if-ge p0, v1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v1, p0

    .line 34
    :goto_0
    if-le v1, v2, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    return v1
.end method
