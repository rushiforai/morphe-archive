.class public Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "shortcut_type"

    .line 6
    .line 7
    const-string v0, "avatar"

    .line 8
    .line 9
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "e_close_click"

    .line 18
    .line 19
    invoke-static {v0, p0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->Y(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Ljava/lang/Runnable;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->X(Ljava/lang/Runnable;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_avatar_chat"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 20
    .line 21
    iget-object p1, p1, Ll/clz;->c:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p3, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const-string p2, ""

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ljava/lang/String;

    .line 44
    .line 45
    :goto_0
    invoke-static {p0, p1, p3, p2}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->y2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->Z(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->K1:Lcom/p1/mobile/putong/core/api/h;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/h;->w3(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private synthetic Y(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    .line 3
    .line 4
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "\u53d1\u9001\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j300;->a(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Ljava/lang/Runnable;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    .line 18
    .line 19
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean p4, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 11
    .line 12
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "to_uid"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_avatar_like"

    .line 25
    .line 26
    invoke-static {v1, p4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    const/4 p4, 0x0

    .line 30
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->j:Z

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 37
    .line 38
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "life_pic"

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 49
    .line 50
    const-string v1, "\u8d5e\u4e86\u4f60\u7684\u7167\u7247"

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->picture:Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "\u751f\u6d3b\u7167"

    .line 63
    .line 64
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    const/4 p2, 0x0

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    check-cast p2, Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {v2, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    :goto_0
    if-nez p2, :cond_2

    .line 97
    .line 98
    const-string p2, ""

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 102
    .line 103
    :goto_1
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->toJson()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 110
    .line 111
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->w2:Ll/zt9;

    .line 114
    .line 115
    iget-object p4, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 116
    .line 117
    const-string v1, "profile_comment"

    .line 118
    .line 119
    invoke-static {v1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p2, p1, p4, v1}, Ll/zt9;->b3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    new-instance p4, Ll/g300;

    .line 128
    .line 129
    invoke-direct {p4, v0}, Ll/g300;-><init>(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2, p4}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    new-instance p2, Ll/h300;

    .line 141
    .line 142
    invoke-direct {p2, p0, p3}, Ll/h300;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Ljava/lang/Runnable;)V

    .line 143
    .line 144
    .line 145
    new-instance p3, Ll/i300;

    .line 146
    .line 147
    invoke-direct {p3, p0}, Ll/i300;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;)V

    .line 148
    .line 149
    .line 150
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 6
    .line 7
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->d:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const-string v3, "\u4ed6"

    .line 32
    .line 33
    const-string v4, "\u5979"

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    move-object v2, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    move-object v2, v3

    .line 40
    :goto_0
    const-string v5, "\u7684\u7167\u7247"

    .line 41
    .line 42
    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->g:Lv/VText;

    .line 50
    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v5, "\u5938\u5938"

    .line 54
    .line 55
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    move-object v3, v4

    .line 65
    :cond_3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, "\u7684\u7167\u7247\uff0c\u5f00\u542f\u804a\u5929\u5427"

    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->f:Lv/VDraweeView;

    .line 83
    .line 84
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->h:Lv/VText;

    .line 90
    .line 91
    new-instance v1, Ll/d300;

    .line 92
    .line 93
    invoke-direct {v1, p1, p3, p2}, Ll/d300;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/Media;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->i:Lv/VText;

    .line 100
    .line 101
    new-instance v1, Ll/e300;

    .line 102
    .line 103
    invoke-direct {v1, p0, p1, p2, p3}, Ll/e300;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->e:Lv/VImage;

    .line 110
    .line 111
    new-instance p2, Ll/f300;

    .line 112
    .line 113
    invoke-direct {p2, p1, p3}, Ll/f300;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    const-string p0, "e_avatar_compliment"

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->W(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->c:Lv/VImage;

    .line 22
    .line 23
    sget v1, Ll/ibc0;->L7:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->e:Lv/VImage;

    .line 29
    .line 30
    sget v1, Ll/ibc0;->n7:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->d:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget v2, Ll/g9c0;->i:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->g:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v2, Ll/g9c0;->g:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->h:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget v2, Ll/g9c0;->g:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->i:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget v1, Ll/g9c0;->g:I

    .line 87
    .line 88
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    .line 94
    .line 95
    :cond_0
    return-void
.end method
