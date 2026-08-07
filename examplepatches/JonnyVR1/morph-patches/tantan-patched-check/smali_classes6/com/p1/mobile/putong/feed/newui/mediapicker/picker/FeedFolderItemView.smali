.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/widget/ImageView;

.field public e:Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;

.field public f:Ll/ewi;


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

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x4h;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public c(Ll/ewi;ZILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;)V
    .locals 5

    .line 1
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->e:Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p5, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move-object p5, p1

    .line 8
    :goto_0
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->f:Ll/ewi;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->b()Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 11
    .line 12
    .line 13
    move-result-object p5

    .line 14
    iget-object p5, p5, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->b()Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-ne p5, v0, :cond_1

    .line 25
    .line 26
    move p5, v1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move p5, v2

    .line 29
    :goto_1
    if-eqz p2, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    iget p3, p1, Ll/ewi;->d:I

    .line 33
    .line 34
    iget-object v0, p1, Ll/ewi;->c:Ll/vg60;

    .line 35
    .line 36
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-le p3, v0, :cond_3

    .line 43
    .line 44
    iget p3, p1, Ll/ewi;->d:I

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    iget-object p3, p1, Ll/ewi;->c:Ll/vg60;

    .line 48
    .line 49
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    :goto_2
    if-eqz p5, :cond_5

    .line 56
    .line 57
    if-ne p3, v1, :cond_4

    .line 58
    .line 59
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->p3:I

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_4
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->o3:I

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_5
    if-ne p3, v1, :cond_6

    .line 66
    .line 67
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->n3:I

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_6
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->m3:I

    .line 71
    .line 72
    :goto_3
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->c:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->b()Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-virtual {v4, v0, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->b:Lv/VText;

    .line 98
    .line 99
    const/4 v0, 0x4

    .line 100
    if-eqz p2, :cond_a

    .line 101
    .line 102
    if-eqz p5, :cond_7

    .line 103
    .line 104
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->k3:I

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_7
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->j3:I

    .line 108
    .line 109
    :goto_4
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 110
    .line 111
    .line 112
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->a:Lv/VDraweeView;

    .line 117
    .line 118
    if-eqz p1, :cond_8

    .line 119
    .line 120
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 121
    .line 122
    .line 123
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->a:Lv/VDraweeView;

    .line 126
    .line 127
    iget-object p3, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p1, p2, p3}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    goto :goto_5

    .line 133
    :cond_8
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->d:Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->b()Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 143
    .line 144
    iget-object p0, p0, Ll/uyh0;->c:Ll/ewi;

    .line 145
    .line 146
    if-nez p0, :cond_9

    .line 147
    .line 148
    goto :goto_6

    .line 149
    :cond_9
    move v1, v2

    .line 150
    :goto_6
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_a
    iget-object p2, p1, Ll/ewi;->a:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p1, Ll/ewi;->c:Ll/vg60;

    .line 160
    .line 161
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 162
    .line 163
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->a:Lv/VDraweeView;

    .line 168
    .line 169
    if-lez p2, :cond_b

    .line 170
    .line 171
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 172
    .line 173
    .line 174
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 175
    .line 176
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->a:Lv/VDraweeView;

    .line 177
    .line 178
    iget-object p4, p1, Ll/ewi;->c:Ll/vg60;

    .line 179
    .line 180
    iget-object p4, p4, Ll/vg60;->a:Ljava/util/List;

    .line 181
    .line 182
    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p4

    .line 186
    check-cast p4, Lcom/p1/mobile/putong/data/Media;

    .line 187
    .line 188
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {p2, p3, p4}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    goto :goto_7

    .line 194
    :cond_b
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 195
    .line 196
    .line 197
    :goto_7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->d:Landroid/widget/ImageView;

    .line 198
    .line 199
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->b()Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 204
    .line 205
    iget-object p0, p0, Ll/uyh0;->c:Ll/ewi;

    .line 206
    .line 207
    invoke-virtual {p1, p0}, Ll/ewi;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->e:Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->f:Ll/ewi;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;->b(Ll/ewi;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
