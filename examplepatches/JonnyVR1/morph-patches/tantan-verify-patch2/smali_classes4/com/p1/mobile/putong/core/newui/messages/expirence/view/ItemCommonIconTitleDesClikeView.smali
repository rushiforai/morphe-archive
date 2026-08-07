.class public Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;


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

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h4q;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/n100;)V
    .locals 4

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;->msgData:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-eqz p3, :cond_1

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;->msgData:Ljava/util/List;

    .line 22
    .line 23
    const/4 p3, 0x0

    .line 24
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-nez p3, :cond_2

    .line 35
    .line 36
    goto/16 :goto_1

    .line 37
    .line 38
    :cond_2
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;

    .line 39
    .line 40
    sget p4, Ll/qa00;->q:I

    .line 41
    .line 42
    invoke-static {p3, p4}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->d:Lv/VText;

    .line 46
    .line 47
    const/high16 p4, 0x41700000    # 15.0f

    .line 48
    .line 49
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 50
    .line 51
    .line 52
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->d:Lv/VText;

    .line 53
    .line 54
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->title:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->e:Lv/VText;

    .line 60
    .line 61
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->button:Lcom/p1/mobile/putong/core/data/MessageItemButton;

    .line 67
    .line 68
    if-eqz p3, :cond_3

    .line 69
    .line 70
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->f:Lv/VText;

    .line 71
    .line 72
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageItemButton;->title:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->f:Lv/VText;

    .line 78
    .line 79
    const/4 p4, 0x1

    .line 80
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->f:Lv/VText;

    .line 84
    .line 85
    sget v0, Ll/qa00;->j:I

    .line 86
    .line 87
    const/high16 v1, 0x40e00000    # 7.0f

    .line 88
    .line 89
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {p3, v0, v2, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 98
    .line 99
    .line 100
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->e:Lv/VText;

    .line 101
    .line 102
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-static {p3, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->f:Lv/VText;

    .line 110
    .line 111
    const/4 v0, 0x0

    .line 112
    invoke-virtual {p3, v0, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 113
    .line 114
    .line 115
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->d:Lv/VText;

    .line 116
    .line 117
    invoke-virtual {p3, v0, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 118
    .line 119
    .line 120
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 121
    .line 122
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->c:Lv/VDraweeView;

    .line 123
    .line 124
    sget v0, Ll/ibc0;->Z:I

    .line 125
    .line 126
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 127
    .line 128
    .line 129
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p3

    .line 135
    if-nez p3, :cond_4

    .line 136
    .line 137
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 138
    .line 139
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->c:Lv/VDraweeView;

    .line 140
    .line 141
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->iconUrl:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_4
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->f:Lv/VText;

    .line 147
    .line 148
    new-instance p4, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;

    .line 149
    .line 150
    invoke-direct {p4, p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;Lcom/p1/mobile/android/app/Act;)V

    .line 151
    .line 152
    .line 153
    invoke-static {p3, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 157
    .line 158
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_6

    .line 163
    .line 164
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->id:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-nez p1, :cond_6

    .line 173
    .line 174
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->statistics:Lcom/p1/mobile/putong/core/data/MessageItemStatistics;

    .line 175
    .line 176
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->data:Lcom/p1/mobile/putong/core/data/MessageItemdata;

    .line 177
    .line 178
    if-eqz p2, :cond_5

    .line 179
    .line 180
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageItemdata;->tips_source:Ljava/lang/String;

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_5
    const-string p2, ""

    .line 184
    .line 185
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageItemStatistics;->id:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    const-string p3, "tips_source"

    .line 198
    .line 199
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    filled-new-array {p2}, [Ll/pf60;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    invoke-static {p1, p0, p2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 208
    .line 209
    .line 210
    :cond_6
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->d:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->e:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->f:Lv/VText;

    .line 52
    .line 53
    sget v0, Ll/ibc0;->t:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
