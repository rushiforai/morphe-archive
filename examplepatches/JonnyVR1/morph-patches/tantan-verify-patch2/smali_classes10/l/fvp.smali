.class public Ll/fvp;
.super Ll/d3q;
.source "SourceFile"

# interfaces
.implements Ll/pam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/ViewGroup;",
        ">;",
        "Ll/pam;"
    }
.end annotation


# instance fields
.field public final a:Ll/xup;

.field public b:Ll/x20;

.field public c:Ll/iup;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/view/View;

.field public o:Landroid/widget/TextView;

.field public p:Lv/VCheckBox;

.field public q:Landroid/widget/TextView;

.field public r:Z

.field public s:Z


# direct methods
.method public constructor <init>(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ll/d3q;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Ll/fvp;->r:Z

    .line 18
    iput-boolean v0, p0, Ll/fvp;->s:Z

    .line 19
    iput-object p1, p0, Ll/fvp;->a:Ll/xup;

    .line 20
    iput-object p2, p0, Ll/fvp;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;

    return-void
.end method

.method public constructor <init>(Ll/xup;Ll/iup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ll/d3q;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/fvp;->r:Z

    .line 23
    iput-boolean v0, p0, Ll/fvp;->s:Z

    .line 24
    iput-object p1, p0, Ll/fvp;->a:Ll/xup;

    .line 25
    iput-object p2, p0, Ll/fvp;->c:Ll/iup;

    .line 26
    iput-object p3, p0, Ll/fvp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    return-void
.end method

.method public constructor <init>(Ll/xup;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/fvp;->r:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/fvp;->s:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/fvp;->a:Ll/xup;

    .line 10
    .line 11
    iput-object p2, p0, Ll/fvp;->b:Ll/x20;

    .line 12
    .line 13
    iput-object p3, p0, Ll/fvp;->e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic H(Ll/fvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fvp;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/fvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fvp;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/fvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fvp;->T(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/fvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fvp;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/fvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fvp;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/fvp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fvp;->S()V

    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput-boolean p1, p0, Ll/fvp;->s:Z

    .line 19
    .line 20
    iget-object p0, p0, Ll/fvp;->b:Ll/x20;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0}, Ll/x20;->call()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/fvp;->e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fvp;->V(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/fvp;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->anchorId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fvp;->V(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic R(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput-boolean p1, p0, Ll/fvp;->s:Z

    .line 19
    .line 20
    iget-object p0, p0, Ll/fvp;->c:Ll/iup;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/iup;->M0()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic S()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fvp;->c:Ll/iup;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fvp;->a:Ll/xup;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/iup;->J0(Ll/xup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/fvp;->a:Ll/xup;

    .line 2
    .line 3
    iget-object v0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->anchorId:Ljava/lang/String;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "0"

    .line 15
    .line 16
    :goto_0
    new-instance v0, Ll/zup;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/zup;-><init>(Ll/fvp;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p1, v0}, Ll/xup;->j4(Ljava/lang/String;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public U(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->Q4:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->R4:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->t:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Ll/fvp;->i:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->e4:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/TextView;

    .line 41
    .line 42
    iput-object v0, p0, Ll/fvp;->j:Landroid/widget/TextView;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->X1:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VImage;

    .line 51
    .line 52
    iput-object v0, p0, Ll/fvp;->k:Lv/VImage;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->U3:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 61
    .line 62
    iput-object v0, p0, Ll/fvp;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 63
    .line 64
    sget v0, Ll/mdc0;->X3:I

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroid/widget/TextView;

    .line 71
    .line 72
    iput-object v0, p0, Ll/fvp;->m:Landroid/widget/TextView;

    .line 73
    .line 74
    sget v0, Ll/mdc0;->t5:I

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Landroid/widget/TextView;

    .line 81
    .line 82
    iput-object v0, p0, Ll/fvp;->o:Landroid/widget/TextView;

    .line 83
    .line 84
    sget v0, Ll/mdc0;->u5:I

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Ll/fvp;->n:Landroid/view/View;

    .line 91
    .line 92
    sget v0, Ll/mdc0;->W:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/widget/TextView;

    .line 99
    .line 100
    iput-object v0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 101
    .line 102
    sget v0, Ll/mdc0;->p0:I

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lv/VCheckBox;

    .line 109
    .line 110
    iput-object v0, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 111
    .line 112
    iget-boolean v1, p0, Ll/fvp;->s:Z

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/fvp;->e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 118
    .line 119
    if-eqz v0, :cond_1

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/fvp;->X(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V

    .line 122
    .line 123
    .line 124
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 125
    .line 126
    if-eqz v0, :cond_0

    .line 127
    .line 128
    new-instance v0, Ll/avp;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Ll/avp;-><init>(Ll/fvp;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_0
    new-instance v0, Ll/bvp;

    .line 138
    .line 139
    invoke-direct {v0, p0}, Ll/bvp;-><init>(Ll/fvp;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/fvp;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;

    .line 146
    .line 147
    if-eqz v0, :cond_2

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Ll/fvp;->W(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;)V

    .line 150
    .line 151
    .line 152
    new-instance v0, Ll/cvp;

    .line 153
    .line 154
    invoke-direct {v0, p0}, Ll/cvp;-><init>(Ll/fvp;)V

    .line 155
    .line 156
    .line 157
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 158
    .line 159
    .line 160
    :cond_2
    iget-object v0, p0, Ll/fvp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    .line 161
    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    invoke-virtual {p0, v0}, Ll/fvp;->Y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V

    .line 165
    .line 166
    .line 167
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 168
    .line 169
    if-eqz v0, :cond_3

    .line 170
    .line 171
    new-instance v0, Ll/dvp;

    .line 172
    .line 173
    invoke-direct {v0, p0}, Ll/dvp;-><init>(Ll/fvp;)V

    .line 174
    .line 175
    .line 176
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 177
    .line 178
    .line 179
    :cond_3
    return-void
.end method

.method public V(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fvp;->a:Ll/xup;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final W(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/fvp;->m:Landroid/widget/TextView;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->rank:J

    .line 19
    .line 20
    const-wide/16 v5, 0x1

    .line 21
    .line 22
    cmp-long v0, v3, v5

    .line 23
    .line 24
    const/high16 v5, 0x41c00000    # 24.0f

    .line 25
    .line 26
    const-string v6, "context_livingAct"

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 31
    .line 32
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpENVdKM0IzWEFXSEZDSktVNk1XQTdRREhYMkUzMjE0IiwidyI6NjYsImgiOjY2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE4NDgzNjk0MTI0OTgxMjE3Mn0.png"

    .line 33
    .line 34
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-static {v6, v0, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-wide/16 v7, 0x2

    .line 48
    .line 49
    cmp-long v0, v3, v7

    .line 50
    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 54
    .line 55
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpCMlo2UjM3M0ZPQ1VJT1BNUElaR1ZaVjdaV0tIWDE0IiwidyI6NjYsImgiOjY2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTA4MzI2ODAzNjI5MjE1NDU3NDN9.png"

    .line 56
    .line 57
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    invoke-static {v6, v0, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 65
    .line 66
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const-wide/16 v7, 0x3

    .line 71
    .line 72
    cmp-long v0, v3, v7

    .line 73
    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 77
    .line 78
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNBWEZUMlhBSDdZUDZaNUlXVTJHTU1BS1lJSk0yUDE0IiwidyI6NjYsImgiOjY2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE4NDgxOTg1OTc2MDkyMTI4NH0.png"

    .line 79
    .line 80
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-static {v6, v0, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 88
    .line 89
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 94
    .line 95
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v4, ""

    .line 98
    .line 99
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->rank:J

    .line 103
    .line 104
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 115
    .line 116
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    :goto_0
    iget-object v0, p0, Ll/fvp;->i:Lv/VDraweeView;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->anchorAvatar:Ljava/lang/String;

    .line 122
    .line 123
    sget v4, Ll/qa00;->E:I

    .line 124
    .line 125
    invoke-static {v6, v0, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/fvp;->j:Landroid/widget/TextView;

    .line 129
    .line 130
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->anchorName:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->gender:Ljava/lang/String;

    .line 136
    .line 137
    const-string v3, "female"

    .line 138
    .line 139
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget-object v3, p0, Ll/fvp;->k:Lv/VImage;

    .line 144
    .line 145
    if-eqz v0, :cond_3

    .line 146
    .line 147
    sget v0, Ll/obc0;->i3:I

    .line 148
    .line 149
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_3
    sget v0, Ll/obc0;->j3:I

    .line 154
    .line 155
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 156
    .line 157
    .line 158
    :goto_1
    iget-object v0, p0, Ll/fvp;->m:Landroid/widget/TextView;

    .line 159
    .line 160
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tg:I

    .line 161
    .line 162
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->memberNum:J

    .line 163
    .line 164
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-static {v3, v4}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/fvp;->o:Landroid/widget/TextView;

    .line 176
    .line 177
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->score:J

    .line 178
    .line 179
    long-to-double v3, v3

    .line 180
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Ll/fvp;->n:Landroid/view/View;

    .line 188
    .line 189
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 190
    .line 191
    xor-int/2addr v0, v2

    .line 192
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 196
    .line 197
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 198
    .line 199
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 203
    .line 204
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/fvp;->m:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->rank:I

    .line 18
    .line 19
    const/high16 v2, 0x41c00000    # 24.0f

    .line 20
    .line 21
    const-string v3, "context_livingAct"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    if-ne v0, v4, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 27
    .line 28
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpENVdKM0IzWEFXSEZDSktVNk1XQTdRREhYMkUzMjE0IiwidyI6NjYsImgiOjY2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE4NDgzNjk0MTI0OTgxMjE3Mn0.png"

    .line 29
    .line 30
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v3, v0, v5, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 38
    .line 39
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v5, 0x2

    .line 44
    if-ne v0, v5, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 47
    .line 48
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpCMlo2UjM3M0ZPQ1VJT1BNUElaR1ZaVjdaV0tIWDE0IiwidyI6NjYsImgiOjY2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTA4MzI2ODAzNjI5MjE1NDU3NDN9.png"

    .line 49
    .line 50
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-static {v3, v0, v5, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const/4 v5, 0x3

    .line 64
    if-ne v0, v5, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 67
    .line 68
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNBWEZUMlhBSDdZUDZaNUlXVTJHTU1BS1lJSk0yUDE0IiwidyI6NjYsImgiOjY2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE4NDgxOTg1OTc2MDkyMTI4NH0.png"

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-static {v3, v0, v5, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 84
    .line 85
    new-instance v2, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v5, ""

    .line 88
    .line 89
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->rank:I

    .line 93
    .line 94
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 105
    .line 106
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    :goto_0
    iget-object v0, p0, Ll/fvp;->i:Lv/VDraweeView;

    .line 110
    .line 111
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

    .line 112
    .line 113
    sget v5, Ll/qa00;->E:I

    .line 114
    .line 115
    invoke-static {v3, v0, v2, v5}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/fvp;->j:Landroid/widget/TextView;

    .line 119
    .line 120
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 126
    .line 127
    const-string v2, "female"

    .line 128
    .line 129
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iget-object v2, p0, Ll/fvp;->k:Lv/VImage;

    .line 134
    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    sget v0, Ll/obc0;->i3:I

    .line 138
    .line 139
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_3
    sget v0, Ll/obc0;->j3:I

    .line 144
    .line 145
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 146
    .line 147
    .line 148
    :goto_1
    new-instance v0, Ll/a3o0;

    .line 149
    .line 150
    invoke-direct {v0, v1}, Ll/a3o0;-><init>(Z)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Ll/fvp;->a:Ll/xup;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ll/a3o0;->t(Ll/ner;)V

    .line 156
    .line 157
    .line 158
    new-instance v2, Lcom/p1/mobile/putong/data/UserMedal;

    .line 159
    .line 160
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

    .line 161
    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

    .line 164
    .line 165
    iput-object v3, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 166
    .line 167
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalGrade:I

    .line 168
    .line 169
    iput v3, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 172
    .line 173
    iput-object v3, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p0, Ll/fvp;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 176
    .line 177
    invoke-virtual {v0, v3, v2}, Ll/a3o0;->r(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/fvp;->o:Landroid/widget/TextView;

    .line 181
    .line 182
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->score:J

    .line 183
    .line 184
    long-to-double v2, v2

    .line 185
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/fvp;->n:Landroid/view/View;

    .line 193
    .line 194
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 195
    .line 196
    xor-int/2addr v0, v4

    .line 197
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 201
    .line 202
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 203
    .line 204
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    iget-object p0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 208
    .line 209
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fvp;->g:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fvp;->h:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/fvp;->k:Lv/VImage;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/fvp;->m:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/fvp;->i:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->anchorAvatar:Ljava/lang/String;

    .line 25
    .line 26
    sget v3, Ll/qa00;->E:I

    .line 27
    .line 28
    const-string v4, "context_livingAct"

    .line 29
    .line 30
    invoke-static {v4, v0, v2, v3}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/fvp;->j:Landroid/widget/TextView;

    .line 34
    .line 35
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->anchorName:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/a3o0;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ll/a3o0;-><init>(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/fvp;->a:Ll/xup;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ll/a3o0;->t(Ll/ner;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Lcom/p1/mobile/putong/data/UserMedal;

    .line 51
    .line 52
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->anchorAvatar:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v3, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 58
    .line 59
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->medalGrade:I

    .line 60
    .line 61
    iput v3, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->medalName:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v3, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p0, Ll/fvp;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 68
    .line 69
    invoke-virtual {v0, v3, v2}, Ll/a3o0;->r(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 70
    .line 71
    .line 72
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->equipped:Z

    .line 73
    .line 74
    iget-object v2, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 75
    .line 76
    const/4 v3, 0x1

    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ng:I

    .line 80
    .line 81
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Jg:I

    .line 91
    .line 92
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 96
    .line 97
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setSelected(Z)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object v0, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 101
    .line 102
    new-instance v2, Ll/evp;

    .line 103
    .line 104
    invoke-direct {v2, p0, p1}, Ll/evp;-><init>(Ll/fvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/fvp;->q:Landroid/widget/TextView;

    .line 111
    .line 112
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 113
    .line 114
    xor-int/2addr v0, v3

    .line 115
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 119
    .line 120
    iget-boolean v0, p0, Ll/fvp;->r:Z

    .line 121
    .line 122
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/fvp;->n:Landroid/view/View;

    .line 126
    .line 127
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fvp;->e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/fvp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->anchorId:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, ""

    .line 16
    .line 17
    return-object p0
.end method

.method public i(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/fvp;->r:Z

    .line 2
    .line 3
    iget-object p1, p0, Ll/fvp;->p:Lv/VCheckBox;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iput-boolean v0, p0, Ll/fvp;->s:Z

    .line 12
    .line 13
    return-void
.end method

.method public isChecked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fvp;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->L2:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fvp;->U(Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
