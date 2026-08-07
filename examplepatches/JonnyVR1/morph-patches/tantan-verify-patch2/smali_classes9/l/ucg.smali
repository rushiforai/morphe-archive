.class public Ll/ucg;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/ycg;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Lv/VDraweeView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/widget/TextView;

.field public q:Lv/VProgressBar;

.field public r:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ycg;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->r3:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic F(Ll/ucg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ucg;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/ucg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ucg;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/ucg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ucg;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ucg;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vcg;->a(Ll/ucg;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Ll/ycg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/ycg;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ycg;->m4()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public O(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ucg;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, -0x73000000

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const p1, 0xffffff

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ucg;->q:Lv/VProgressBar;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ucg;->p:Landroid/widget/TextView;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/ucg;->p:Landroid/widget/TextView;

    .line 27
    .line 28
    new-instance v0, Ll/tcg;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/tcg;-><init>(Ll/ucg;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/ucg;->m:Lv/VDraweeView;

    .line 37
    .line 38
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftIcon:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "context_single_room"

    .line 43
    .line 44
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    .line 49
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftName:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/data/LangModel;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    goto :goto_1

    .line 64
    :catch_0
    move-exception p1

    .line 65
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    const-string p1, ""

    .line 69
    .line 70
    :goto_1
    iget-object v0, p0, Ll/ucg;->n:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->m4:I

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 94
    .line 95
    check-cast v0, Ll/ycg;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/oo2;->r0()Ll/v5g;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 108
    .line 109
    check-cast v0, Ll/ycg;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ll/oo2;->r0()Ll/v5g;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 120
    .line 121
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 122
    .line 123
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v0, v1}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_1

    .line 132
    .line 133
    iget-object p0, p0, Ll/ucg;->o:Landroid/widget/TextView;

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->k4:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 146
    .line 147
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftAmount:I

    .line 148
    .line 149
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_1
    iget-object p0, p0, Ll/ucg;->o:Landroid/widget/TextView;

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->l4:I

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 178
    .line 179
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftAmount:I

    .line 180
    .line 181
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    :goto_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ycg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ucg;->K(Ll/ycg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/ucg;->J(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x11

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ucg;->r:Landroid/widget/TextView;

    .line 10
    .line 11
    new-instance v0, Ll/qcg;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qcg;-><init>(Ll/ucg;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/ucg;->l:Landroid/view/View;

    .line 20
    .line 21
    new-instance v0, Ll/rcg;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/rcg;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ucg;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 30
    .line 31
    new-instance v0, Ll/scg;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/scg;-><init>(Ll/ucg;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ycg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ucg;->K(Ll/ycg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
