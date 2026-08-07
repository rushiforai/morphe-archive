.class public Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g6h;->a(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->a:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->b:Lv/VFrame;

    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->c:Lv/VDraweeView;

    .line 29
    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 31
    .line 32
    const/high16 v4, 0x42880000    # 68.0f

    .line 33
    .line 34
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-virtual {v0, v1, v2, v5, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->b:Lv/VFrame;

    .line 50
    .line 51
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->a:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 59
    .line 60
    const/high16 v4, 0x42900000    # 72.0f

    .line 61
    .line 62
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-virtual {v0, v1, v2, v5, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 71
    .line 72
    .line 73
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 74
    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/16 v2, 0x8

    .line 91
    .line 92
    const-string v4, "\r\n"

    .line 93
    .line 94
    if-lt v0, v2, :cond_1

    .line 95
    .line 96
    const/4 v0, 0x5

    .line 97
    invoke-virtual {v1, v3, v0}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    new-instance v5, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v1, v3, v0, v2}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    const/4 v2, 0x6

    .line 125
    if-lt v0, v2, :cond_2

    .line 126
    .line 127
    const/4 v0, 0x4

    .line 128
    invoke-virtual {v1, v3, v0}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    new-instance v5, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v1, v3, v0, v2}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->d:Landroid/widget/TextView;

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceItemView;->e:Landroid/widget/TextView;

    .line 156
    .line 157
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 158
    .line 159
    if-lez p1, :cond_3

    .line 160
    .line 161
    const/high16 p1, 0x41980000    # 19.0f

    .line 162
    .line 163
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    div-int/lit8 p1, p1, 0x2

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_3
    const/high16 p1, 0x40c00000    # 6.0f

    .line 171
    .line 172
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    :goto_2
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 177
    .line 178
    .line 179
    return-void
.end method
