.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lcs;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->iconUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    xor-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->b:Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->iconUrl:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "context_livingAct"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->c:Lv/VText;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->title:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->d:Lv/VText;

    .line 31
    .line 32
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->score:J

    .line 33
    .line 34
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->unit:Ljava/lang/String;

    .line 39
    .line 40
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "%d%s"

    .line 45
    .line 46
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->e:Lv/VText;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->btnText:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "invalid"

    .line 61
    .line 62
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->status:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    const-string v0, "done"

    .line 71
    .line 72
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->status:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->e:Lv/VText;

    .line 82
    .line 83
    sget v1, Ll/obc0;->Z0:I

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->e:Lv/VText;

    .line 89
    .line 90
    const/16 v1, -0x4500

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->e:Lv/VText;

    .line 97
    .line 98
    sget v1, Ll/obc0;->W0:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->e:Lv/VText;

    .line 104
    .line 105
    const v1, -0x7f000001

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->desc:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_2

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->h:Lv/VText;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->desc:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->f:Landroid/view/View;

    .line 127
    .line 128
    const/4 v0, 0x0

    .line 129
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->g:Landroid/widget/FrameLayout;

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->f:Landroid/view/View;

    .line 139
    .line 140
    const/16 v0, 0x8

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->g:Landroid/widget/FrameLayout;

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAdvanceTaskModelView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
