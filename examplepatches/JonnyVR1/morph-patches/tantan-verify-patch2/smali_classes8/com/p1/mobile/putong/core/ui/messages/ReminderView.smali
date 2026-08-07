.class public Lcom/p1/mobile/putong/core/ui/messages/ReminderView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public g:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->g(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kxc0;->a(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->j(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->j(Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->g:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 23
    .line 24
    iget-object v3, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 27
    .line 28
    xor-int/2addr p1, v2

    .line 29
    invoke-interface {v0, v1, v3, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentLike(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/ixc0;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/ixc0;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/jxc0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/jxc0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {v0, v1, v2, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsSimpleTextAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 63
    .line 64
    iget-object v2, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->g:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 67
    .line 68
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    const/4 v4, 0x0

    .line 72
    const-string v5, "ReminderView"

    .line 73
    .line 74
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsFeedPreviewAct(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 6
    .line 7
    const-string v2, "moment"

    .line 8
    .line 9
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_7

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->g:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-interface {p1, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->d:Lv/VText;

    .line 38
    .line 39
    sget-object v2, Ll/pzi0;->l:Ljava/text/SimpleDateFormat;

    .line 40
    .line 41
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 42
    .line 43
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v2, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 55
    .line 56
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->j(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 64
    .line 65
    const-string v0, "avatar"

    .line 66
    .line 67
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->c:Lv/VText;

    .line 72
    .line 73
    const/16 v1, 0x8

    .line 74
    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->X4:I

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->b:Lv/VImage;

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_2

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->W4:I

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 119
    .line 120
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_6

    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-lez p1, :cond_6

    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->f:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 139
    .line 140
    const/4 v0, 0x0

    .line 141
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 146
    .line 147
    instance-of v2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 148
    .line 149
    if-eqz v2, :cond_3

    .line 150
    .line 151
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 152
    .line 153
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 154
    .line 155
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->b:Lv/VImage;

    .line 156
    .line 157
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_3
    instance-of v2, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 162
    .line 163
    if-eqz v2, :cond_4

    .line 164
    .line 165
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 166
    .line 167
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->b:Lv/VImage;

    .line 168
    .line 169
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_4
    const/4 p1, 0x0

    .line 174
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-eqz v2, :cond_5

    .line 179
    .line 180
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 181
    .line 182
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->a:Lv/VDraweeView;

    .line 183
    .line 184
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {v1, v2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 189
    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->a:Lv/VDraweeView;

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_5
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->a:Lv/VDraweeView;

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->a:Lv/VDraweeView;

    .line 205
    .line 206
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 207
    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->b:Lv/VImage;

    .line 210
    .line 211
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_6
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 216
    .line 217
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->a:Lv/VDraweeView;

    .line 218
    .line 219
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->a:Lv/VDraweeView;

    .line 223
    .line 224
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 225
    .line 226
    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->b:Lv/VImage;

    .line 228
    .line 229
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 230
    .line 231
    .line 232
    :cond_7
    :goto_3
    return-void
.end method

.method public final j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->e:Lv/VImage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/ibc0;->D7:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget p1, Ll/ibc0;->C7:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->e(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->c:Lv/VText;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->d:Lv/VText;

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
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->e:Lv/VImage;

    .line 52
    .line 53
    new-instance v1, Ll/gxc0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/gxc0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/hxc0;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/hxc0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ReminderView;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
