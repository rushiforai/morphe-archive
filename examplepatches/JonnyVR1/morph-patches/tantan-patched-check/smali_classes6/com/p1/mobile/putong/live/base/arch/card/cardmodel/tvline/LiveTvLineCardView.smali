.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field private static final MARGIN:I


# instance fields
.field private ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

.field private ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

.field private mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->e:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->MARGIN:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Ll/efu;Ll/ner;Ll/ft5;)V
    .locals 10

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/efu;->a()Ll/byu;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {p1}, Ll/efu;->a()Ll/byu;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v3, v3, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 12
    .line 13
    invoke-virtual {v1, v2, v3, p2, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->g(Ll/byu;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/ner;Ll/ft5;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/efu;->b()Ll/byu;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/efu;->b()Ll/byu;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {p1}, Ll/efu;->b()Ll/byu;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v6, v1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 33
    .line 34
    const/4 v9, 0x2

    .line 35
    move-object v7, p2

    .line 36
    move-object v8, p3

    .line 37
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->e(Ll/byu;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/ner;Ll/ft5;I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->d()V

    .line 42
    .line 43
    .line 44
    :goto_0
    invoke-virtual {p1}, Ll/efu;->c()Ll/byu;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/efu;->c()Ll/byu;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {p1}, Ll/efu;->c()Ll/byu;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v6, v0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 61
    .line 62
    const/4 v9, 0x3

    .line 63
    move-object v7, p2

    .line 64
    move-object v8, p3

    .line 65
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->e(Ll/byu;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/ner;Ll/ft5;I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->d()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->j0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->L:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->M:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 33
    .line 34
    invoke-static {}, Ll/bnl0;->y0()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    sget v1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->MARGIN:I

    .line 39
    .line 40
    mul-int/lit8 v2, v1, 0x8

    .line 41
    .line 42
    sub-int/2addr v0, v2

    .line 43
    div-int/lit8 v0, v0, 0x3

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 46
    .line 47
    mul-int/lit8 v3, v0, 0x2

    .line 48
    .line 49
    mul-int/lit8 v4, v1, 0x2

    .line 50
    .line 51
    add-int/2addr v4, v3

    .line 52
    invoke-static {v2, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    mul-int/lit8 v1, v1, 0x2

    .line 56
    .line 57
    add-int/2addr v3, v1

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    new-array v4, v2, [Landroid/view/View;

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    aput-object v1, v4, v5

    .line 65
    .line 66
    invoke-static {v3, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 75
    .line 76
    new-array v3, v2, [Landroid/view/View;

    .line 77
    .line 78
    aput-object v1, v3, v5

    .line 79
    .line 80
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 84
    .line 85
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 89
    .line 90
    new-array v2, v2, [Landroid/view/View;

    .line 91
    .line 92
    aput-object v1, v2, v5

    .line 93
    .line 94
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_cover:Lv/VFrame;

    .line 100
    .line 101
    div-int/lit8 v0, v0, 0x2

    .line 102
    .line 103
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_cover:Lv/VFrame;

    .line 109
    .line 110
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_cover:Lv/VFrame;

    .line 116
    .line 117
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->mainLiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;

    .line 121
    .line 122
    sget v1, Ll/qa00;->i:I

    .line 123
    .line 124
    invoke-static {v0, v1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext1LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->ext2LiveView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    .line 133
    .line 134
    invoke-static {p0, v1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    return-void
.end method
