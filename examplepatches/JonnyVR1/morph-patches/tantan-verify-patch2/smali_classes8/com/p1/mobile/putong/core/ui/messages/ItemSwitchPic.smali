.class public Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/core/data/Message;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Z)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "e_switch_photo_reply"

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-static {p0, p3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string p3, "from_pic_exchange_reply_type"

    .line 28
    .line 29
    invoke-static {p2, p0, p1, p3}, Ll/r600;->t(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p3, "photo_owner_id"

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_1
    const-string v1, "to_uid"

    .line 67
    .line 68
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    filled-new-array {p3, v0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    const-string v0, "e_switch_photo_message"

    .line 77
    .line 78
    invoke-static {v0, p0, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 82
    .line 83
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_3

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 90
    .line 91
    const/4 p3, 0x0

    .line 92
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 97
    .line 98
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    if-eqz p3, :cond_3

    .line 103
    .line 104
    iget-object p3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p3

    .line 110
    if-nez p3, :cond_3

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-interface {p3, p2, p1, p0}, Ll/r97;->n1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    return-void
.end method

.method private synthetic h(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {p1, v4}, Ll/k900;->h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v3, v4}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const-string v1, ""

    .line 60
    .line 61
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    const/4 v4, 0x1

    .line 66
    if-nez v3, :cond_9

    .line 67
    .line 68
    const/high16 v3, 0x41200000    # 10.0f

    .line 69
    .line 70
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    int-to-float v5, v5

    .line 75
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    int-to-float v6, v6

    .line 80
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    int-to-float v7, v7

    .line 85
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    int-to-float v3, v3

    .line 90
    invoke-static {v5, v6, v7, v3}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v5, Ll/wlj;

    .line 101
    .line 102
    invoke-virtual {v5, v3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 103
    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 106
    .line 107
    if-nez v3, :cond_2

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    iput-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 114
    .line 115
    :cond_2
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 116
    .line 117
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 118
    .line 119
    if-nez v3, :cond_3

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExchangePicture;->new_()Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    sget-object v5, Lcom/p1/mobile/putong/core/data/ExchangePicture;->unknow:Ljava/lang/String;

    .line 126
    .line 127
    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->status:Ljava/lang/String;

    .line 128
    .line 129
    sget v5, Lcom/p1/mobile/putong/core/data/ExchangePicture;->SEND_MESSAGE:I

    .line 130
    .line 131
    iput v5, v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->exchangeType:I

    .line 132
    .line 133
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 134
    .line 135
    iput-object v3, v5, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 136
    .line 137
    :cond_3
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->status:Ljava/lang/String;

    .line 138
    .line 139
    sget-object v6, Lcom/p1/mobile/putong/core/data/ExchangePicture;->unfinished:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    if-nez v5, :cond_5

    .line 146
    .line 147
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->status:Ljava/lang/String;

    .line 148
    .line 149
    sget-object v6, Lcom/p1/mobile/putong/core/data/ExchangePicture;->unknow:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-eqz v5, :cond_4

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_4
    move v5, v2

    .line 159
    goto :goto_2

    .line 160
    :cond_5
    :goto_1
    move v5, v4

    .line 161
    :goto_2
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 162
    .line 163
    new-instance v7, Ll/ngq;

    .line 164
    .line 165
    invoke-direct {v7, p0, p1, v0, v5}, Ll/ngq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Z)V

    .line 166
    .line 167
    .line 168
    invoke-static {v6, v7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 169
    .line 170
    .line 171
    if-eqz v5, :cond_8

    .line 172
    .line 173
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->c:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 179
    .line 180
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 181
    .line 182
    const/4 v7, 0x2

    .line 183
    const/16 v8, 0x64

    .line 184
    .line 185
    invoke-virtual {v5, v6, v1, v7, v8}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 186
    .line 187
    .line 188
    iget v1, v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->exchangeType:I

    .line 189
    .line 190
    sget v5, Lcom/p1/mobile/putong/core/data/ExchangePicture;->SEND_MESSAGE:I

    .line 191
    .line 192
    if-ne v1, v5, :cond_7

    .line 193
    .line 194
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_7

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 201
    .line 202
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 203
    .line 204
    .line 205
    iget-object v1, v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->status:Ljava/lang/String;

    .line 206
    .line 207
    sget-object v3, Lcom/p1/mobile/putong/core/data/ExchangePicture;->unknow:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-eqz v1, :cond_6

    .line 214
    .line 215
    const-string v1, "error"

    .line 216
    .line 217
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_6
    const-string v1, "waitreply"

    .line 221
    .line 222
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 223
    .line 224
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 225
    .line 226
    const/high16 v3, 0x41700000    # 15.0f

    .line 227
    .line 228
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 229
    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 232
    .line 233
    const-string v3, "\u7b49\u5f85\u4ea4\u6362"

    .line 234
    .line 235
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 240
    .line 241
    sget v3, Ll/ibc0;->O6:I

    .line 242
    .line 243
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 244
    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 247
    .line 248
    const-string v3, "\u56de\u56fe\u67e5\u770b"

    .line 249
    .line 250
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 254
    .line 255
    const/high16 v3, 0x41400000    # 12.0f

    .line 256
    .line 257
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 258
    .line 259
    .line 260
    const-string v1, "noreply"

    .line 261
    .line 262
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e:Landroid/widget/TextView;

    .line 265
    .line 266
    new-instance v3, Ll/ogq;

    .line 267
    .line 268
    invoke-direct {v3, p0, p1, v0}, Ll/ogq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 269
    .line 270
    .line 271
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 272
    .line 273
    .line 274
    goto :goto_4

    .line 275
    :cond_8
    const-string v3, "default"

    .line 276
    .line 277
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->c:Landroid/widget/LinearLayout;

    .line 280
    .line 281
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 285
    .line 286
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 287
    .line 288
    const/high16 v6, 0x430c0000    # 140.0f

    .line 289
    .line 290
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 291
    .line 292
    .line 293
    move-result v7

    .line 294
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 295
    .line 296
    .line 297
    move-result v6

    .line 298
    invoke-virtual {v3, v5, v1, v7, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 299
    .line 300
    .line 301
    :cond_9
    :goto_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    const-string v3, "switchphoto_type"

    .line 306
    .line 307
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    const-string v5, "photo_owner_id"

    .line 314
    .line 315
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 316
    .line 317
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 318
    .line 319
    .line 320
    move-result-object v5

    .line 321
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 322
    .line 323
    .line 324
    move-result v6

    .line 325
    if-eqz v6, :cond_a

    .line 326
    .line 327
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 328
    .line 329
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    goto :goto_5

    .line 334
    :cond_a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    :goto_5
    const-string v6, "to_uid"

    .line 343
    .line 344
    invoke-static {v6, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    filled-new-array {v3, v5, v0}, [Ll/pf60;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    const-string v3, "e_switch_photo_message"

    .line 353
    .line 354
    invoke-static {v3, v1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 358
    .line 359
    .line 360
    move-result p1

    .line 361
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->f:Landroid/widget/TextView;

    .line 362
    .line 363
    if-nez p1, :cond_b

    .line 364
    .line 365
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 366
    .line 367
    .line 368
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->f:Landroid/widget/TextView;

    .line 369
    .line 370
    const-string v0, "\u4ee5\u56fe\u6362\u56fe"

    .line 371
    .line 372
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 373
    .line 374
    .line 375
    goto :goto_6

    .line 376
    :cond_b
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 377
    .line 378
    .line 379
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->b:Lv/VDraweeView;

    .line 380
    .line 381
    new-instance v0, Ll/pgq;

    .line 382
    .line 383
    invoke-direct {v0, p0}, Ll/pgq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 387
    .line 388
    .line 389
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->h:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "default"

    .line 26
    .line 27
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 60
    .line 61
    invoke-interface {v0, v1, v2, p0}, Ll/r97;->M5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_2
    :goto_0
    return-object v1
.end method

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qgq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->d(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->f:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->i:I

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwitchPic;->d:Landroid/widget/ImageView;

    .line 37
    .line 38
    sget v0, Ll/ibc0;->u4:I

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
