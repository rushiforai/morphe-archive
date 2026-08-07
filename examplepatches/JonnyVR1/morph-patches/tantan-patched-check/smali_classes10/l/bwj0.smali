.class public Ll/bwj0;
.super Ll/d0j0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d0j0<",
        "Ll/awj0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lv/VRelative;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Lv/VRecyclerView;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Lv/VRecyclerView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Ll/iwj0;

.field public r:Ll/iwj0;


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d0j0;-><init>(Lv/VFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    new-instance v0, Ll/iwj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/iwj0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/bwj0;->q:Ll/iwj0;

    .line 7
    .line 8
    iget-object v0, p0, Ll/bwj0;->k:Lv/VRecyclerView;

    .line 9
    .line 10
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v1, v2, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/bwj0;->k:Lv/VRecyclerView;

    .line 24
    .line 25
    new-instance v1, Ll/bwj0$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/bwj0$a;-><init>(Ll/bwj0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bwj0;->k:Lv/VRecyclerView;

    .line 34
    .line 35
    iget-object v1, p0, Ll/bwj0;->q:Ll/iwj0;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/iwj0;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/iwj0;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/bwj0;->r:Ll/iwj0;

    .line 46
    .line 47
    iget-object v0, p0, Ll/bwj0;->n:Lv/VRecyclerView;

    .line 48
    .line 49
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-direct {v1, v2, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/bwj0;->n:Lv/VRecyclerView;

    .line 62
    .line 63
    new-instance v1, Ll/bwj0$b;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/bwj0$b;-><init>(Ll/bwj0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/bwj0;->n:Lv/VRecyclerView;

    .line 72
    .line 73
    iget-object p0, p0, Ll/bwj0;->r:Ll/iwj0;

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/bwj0;->y(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/bwj0;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->n6:I

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bwj0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/d0j0;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/mdc0;->F7:I

    .line 2
    .line 3
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 5
    .line 6
    const-string p3, "resultAnnouncing"

    .line 7
    .line 8
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->gameResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 16
    .line 17
    if-nez p2, :cond_2

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_2
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->winnerRole:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "normal"

    .line 23
    .line 24
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    const/4 v0, 0x1

    .line 29
    if-eqz p3, :cond_3

    .line 30
    .line 31
    iget-object p3, p0, Ll/bwj0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 32
    .line 33
    const-string v1, "https://auto.tancdn.com/v1/raw/53ad74a9-32e4-4cc7-8faf-0ba93dd9e2eb12.pdf"

    .line 34
    .line 35
    invoke-virtual {p3, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->winnerRole:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "undercover"

    .line 42
    .line 43
    invoke-static {p3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    if-eqz p3, :cond_4

    .line 48
    .line 49
    iget-object p3, p0, Ll/bwj0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 50
    .line 51
    const-string v1, "https://auto.tancdn.com/v1/raw/d16e17b0-941e-47f2-bad6-0a8a95be176d12.pdf"

    .line 52
    .line 53
    invoke-virtual {p3, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    :cond_4
    :goto_1
    iget-object p3, p0, Ll/bwj0;->q:Ll/iwj0;

    .line 57
    .line 58
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->normalMasks:Ljava/util/List;

    .line 59
    .line 60
    invoke-virtual {p3, v0}, Ll/iwj0;->A(Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    iget-object p3, p0, Ll/bwj0;->r:Ll/iwj0;

    .line 64
    .line 65
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->undercoverMasks:Ljava/util/List;

    .line 66
    .line 67
    invoke-virtual {p3, v0}, Ll/iwj0;->A(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    iget-object p3, p0, Ll/bwj0;->l:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cc:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->normalWord:Ljava/lang/String;

    .line 83
    .line 84
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object p3, p0, Ll/bwj0;->o:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Dc:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->undercoverWord:Ljava/lang/String;

    .line 108
    .line 109
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Ll/bwj0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 121
    .line 122
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    check-cast p2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 127
    .line 128
    iget-object p3, p0, Ll/puj0;->c:Ll/ouj0;

    .line 129
    .line 130
    check-cast p3, Ll/awj0;

    .line 131
    .line 132
    invoke-virtual {p3}, Ll/xzs;->E2()Ll/oo2;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    check-cast p3, Ll/rwn0;

    .line 137
    .line 138
    invoke-virtual {p3}, Ll/rwn0;->p()Z

    .line 139
    .line 140
    .line 141
    move-result p3

    .line 142
    iget-object v0, p0, Ll/bwj0;->p:Lv/VText;

    .line 143
    .line 144
    if-eqz p3, :cond_5

    .line 145
    .line 146
    const/4 p3, 0x0

    .line 147
    invoke-virtual {v0, p3}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_5
    const/16 p3, 0x8

    .line 152
    .line 153
    invoke-virtual {v0, p3}, Landroid/view/View;->setVisibility(I)V

    .line 154
    .line 155
    .line 156
    const/high16 p3, 0x41a00000    # 20.0f

    .line 157
    .line 158
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    iput p3, p2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 163
    .line 164
    :goto_2
    iget-object p3, p0, Ll/bwj0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 165
    .line 166
    invoke-virtual {p3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    .line 168
    .line 169
    iget-object p2, p0, Ll/bwj0;->p:Lv/VText;

    .line 170
    .line 171
    new-instance p3, Ll/bwj0$c;

    .line 172
    .line 173
    invoke-direct {p3, p0, p1}, Ll/bwj0$c;-><init>(Ll/bwj0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    .line 178
    .line 179
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->remainSeconds:I

    .line 180
    .line 181
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->countDownSeconds:I

    .line 182
    .line 183
    invoke-virtual {p0, p2, p1}, Ll/d0j0;->w(II)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public x()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/d0j0;->x()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/d0j0;->s()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/bwj0;->p:Lv/VText;

    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bc:I

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, " %ss"

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0}, Ll/d0j0;->s()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bc:I

    .line 66
    .line 67
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public final y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cwj0;->a(Ll/bwj0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
