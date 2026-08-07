.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
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
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/a2k0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/i1k0;->a:Ll/o1k0;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/o1k0;->b(Ll/a2k0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r2k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/a2k0;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->getTargetRedLevel()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->a:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->status:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->getStatusBtnUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v3, "context_livingAct"

    .line 18
    .line 19
    invoke-static {v3, v2, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isEquipped()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x0

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->c:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 42
    .line 43
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ye:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    const-string v0, "#99ffffff"

    .line 51
    .line 52
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isUnLocked()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->c:Landroid/widget/FrameLayout;

    .line 70
    .line 71
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 80
    .line 81
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xe:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 87
    .line 88
    const-string v1, "#512000"

    .line 89
    .line 90
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    new-instance v0, Ll/q2k0;

    .line 98
    .line 99
    invoke-direct {v0, p1}, Ll/q2k0;-><init>(Ll/a2k0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isUnLocking()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_3

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isLocked()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_2

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    return-void

    .line 120
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->c:Landroid/widget/FrameLayout;

    .line 121
    .line 122
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b:Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Je:I

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->d:Landroid/widget/TextView;

    .line 141
    .line 142
    new-instance v3, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string p1, " "

    .line 151
    .line 152
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->accumulatedScore:I

    .line 156
    .line 157
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string p1, "/"

    .line 161
    .line 162
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->entranceScore:I

    .line 166
    .line 167
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->e:Landroid/widget/ProgressBar;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->getUnlockProgress()I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
