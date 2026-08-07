.class public Ll/pc50;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/uc50;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VFrame;

.field public l:Landroidx/cardview/widget/CardView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Landroid/view/View;

.field public q:Lv/VDraweeView;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VProgress;

.field public w:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Ll/uc50;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->G4:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/pc50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pc50;->J(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/pc50;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc50;->I(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vc50;->a(Ll/pc50;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/uc50;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uc50;->W3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/uc50;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/uc50;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pc50;->o:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pc50;->o:Lv/VText;

    .line 8
    .line 9
    const-string v2, "\u5df2\u8ba2\u9605"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/pc50;->o:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public L(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pc50;->u:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "%ds\u540e\u5c06\u968f\u673a\u8df3\u8f6c\u63a8\u8350\u7684\u76f4\u64ad\u95f4"

    .line 14
    .line 15
    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/pc50;->v:Lv/VProgress;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pc50;->w:Lv/VDraweeView;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "context_common"

    .line 13
    .line 14
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p2}, Ll/q0j;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 p2, 0x0

    .line 22
    const/4 v0, 0x1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/p6s;->D0()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    move p1, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move p1, p2

    .line 38
    :goto_0
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ll/p6s;->D0()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object p2, p0, Ll/pc50;->n:Lv/VText;

    .line 51
    .line 52
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/pc50;->o:Lv/VText;

    .line 56
    .line 57
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    iget-object v1, p0, Ll/pc50;->n:Lv/VText;

    .line 62
    .line 63
    invoke-static {v1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/pc50;->o:Lv/VText;

    .line 67
    .line 68
    invoke-static {v1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :goto_1
    if-nez p1, :cond_2

    .line 72
    .line 73
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 78
    .line 79
    check-cast p2, Ll/uc50;

    .line 80
    .line 81
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p1, p2, v0}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const-string p2, "LiveEnd"

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Ll/tfs$a;->a()Ll/tfs;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string p2, "p_user_live_end"

    .line 100
    .line 101
    invoke-static {p2, p1}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 102
    .line 103
    .line 104
    :cond_2
    iget-object p1, p0, Ll/pc50;->o:Lv/VText;

    .line 105
    .line 106
    new-instance p2, Ll/nc50;

    .line 107
    .line 108
    invoke-direct {p2, p0}, Ll/nc50;-><init>(Ll/pc50;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    if-eqz p3, :cond_3

    .line 115
    .line 116
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 117
    .line 118
    const-string p2, "onlive"

    .line 119
    .line 120
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_3

    .line 125
    .line 126
    iget-object p1, p0, Ll/pc50;->q:Lv/VDraweeView;

    .line 127
    .line 128
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v2, p1, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/pc50;->s:Lv/VText;

    .line 134
    .line 135
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/pc50;->t:Lv/VText;

    .line 141
    .line 142
    const-string p2, "\u53bb\u4ed6\u76f4\u64ad\u95f4\u7ee7\u7eed\u89c2\u770b"

    .line 143
    .line 144
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/pc50;->r:Lv/VText;

    .line 148
    .line 149
    new-instance p2, Ll/oc50;

    .line 150
    .line 151
    invoke-direct {p2, p0, p3}, Ll/oc50;-><init>(Ll/pc50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_3
    iget-object p1, p0, Ll/pc50;->p:Landroid/view/View;

    .line 159
    .line 160
    const/16 p2, 0x8

    .line 161
    .line 162
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/pc50;->q:Lv/VDraweeView;

    .line 166
    .line 167
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Ll/pc50;->s:Lv/VText;

    .line 171
    .line 172
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Ll/pc50;->t:Lv/VText;

    .line 176
    .line 177
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Ll/pc50;->r:Lv/VText;

    .line 181
    .line 182
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/pc50;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
