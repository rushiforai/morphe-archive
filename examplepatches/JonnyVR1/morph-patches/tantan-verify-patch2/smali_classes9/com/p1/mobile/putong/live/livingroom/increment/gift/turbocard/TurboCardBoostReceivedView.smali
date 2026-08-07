.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VText;


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


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jmj0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;Landroid/view/View$OnClickListener;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->i:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->SUPER:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/high16 v0, 0x435b0000    # 219.0f

    .line 13
    .line 14
    const v1, 0x438d8000    # 283.0f

    .line 15
    .line 16
    .line 17
    const-string v2, "context_livingAct"

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->g:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->ge:I

    .line 28
    .line 29
    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    sget v3, Ll/obc0;->L7:I

    .line 43
    .line 44
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->e:Lv/VDraweeView;

    .line 52
    .line 53
    sget-object p2, Ll/zft;->F:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-static {v2, p1, p2, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->f:Lv/VImage;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    sget v0, Ll/obc0;->x8:I

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->i:Lv/VImage;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget p2, Ll/obc0;->z8:I

    .line 88
    .line 89
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_0
    sget-object p2, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->SENIOR:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 98
    .line 99
    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_1

    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->g:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->vd:I

    .line 112
    .line 113
    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    sget v3, Ll/obc0;->K7:I

    .line 127
    .line 128
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->e:Lv/VDraweeView;

    .line 136
    .line 137
    sget-object p2, Ll/zft;->E:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    invoke-static {v2, p1, p2, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->f:Lv/VImage;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    sget v0, Ll/obc0;->w8:I

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->i:Lv/VImage;

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    sget p2, Ll/obc0;->y8:I

    .line 172
    .line 173
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 178
    .line 179
    .line 180
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/TurboCardBoostReceivedView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
