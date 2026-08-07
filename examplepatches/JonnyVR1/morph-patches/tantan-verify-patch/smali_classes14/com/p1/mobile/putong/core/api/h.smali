.class public Lcom/p1/mobile/putong/core/api/h;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ll/byd0;

.field public S:Ll/jxd0;

.field public T:Ll/jxd0;

.field public U:Ll/jxd0;

.field public V:Ll/jxd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/byd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "profile_like_refresh_time_"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide/16 v1, 0x0

    .line 29
    .line 30
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/h;->R:Ll/byd0;

    .line 38
    .line 39
    new-instance p1, Ll/jxd0;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v1, "has_life_tips_show_"

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/h;->S:Ll/jxd0;

    .line 69
    .line 70
    new-instance p1, Ll/jxd0;

    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v2, "ideal_tips_show"

    .line 75
    .line 76
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/h;->T:Ll/jxd0;

    .line 98
    .line 99
    new-instance p1, Ll/jxd0;

    .line 100
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v2, "has_profile_like_entrance"

    .line 104
    .line 105
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 124
    .line 125
    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/h;->U:Ll/jxd0;

    .line 127
    .line 128
    new-instance p1, Ll/jxd0;

    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v2, "showLabelTipsIgnoreCount"

    .line 133
    .line 134
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 153
    .line 154
    .line 155
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/h;->V:Ll/jxd0;

    .line 156
    .line 157
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/h;->p3(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic b3(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->z1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 22
    .line 23
    if-ne v1, v2, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/data/Relationship;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 33
    .line 34
    const-class v2, Lcom/p1/mobile/putong/data/CommonData;

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 43
    .line 44
    new-instance v2, Ll/jq8;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/jq8;-><init>(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-interface {p1, v0, p0, v2, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->processMomentLikeStatusChanged(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 61
    .line 62
    .line 63
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 64
    .line 65
    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/api/h;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/h;->t3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->y1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/api/h;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/h;->q3(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/h;->o3(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/h;->r3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/api/h;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/h;->n3()V

    return-void
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/h;->s3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public m3()V
    .locals 1

    .line 1
    new-instance v0, Ll/lq8;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lq8;-><init>(Lcom/p1/mobile/putong/core/api/h;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n3()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->new_()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0xa

    .line 10
    .line 11
    iput v2, v1, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->receive:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->canLike:Z

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    new-instance v4, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 21
    .line 22
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v5, "\u4f60\u597d\u554a"

    .line 26
    .line 27
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 28
    .line 29
    const-string v5, "\u8fd9\u4e2a\u662f\u4ec0\u4e48\u610f\u601d\u554a"

    .line 30
    .line 31
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 32
    .line 33
    const-string v5, "\u4f60\u8fd9\u4e2a\u662f\u4ec0\u4e48\u610f\u601d\u554a"

    .line 34
    .line 35
    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->toJson()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    long-to-double v4, v4

    .line 58
    iput-wide v4, v3, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->createdTime:D

    .line 59
    .line 60
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->toJson()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 67
    .line 68
    const-string v3, "fake_conversation_profile_like_enter"

    .line 69
    .line 70
    iput-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    const-string v3, "removed"

    .line 73
    .line 74
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 79
    .line 80
    invoke-static {}, Ll/pzi0;->o()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    long-to-double v3, v3

    .line 85
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 86
    .line 87
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 88
    .line 89
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 90
    .line 91
    invoke-static {}, Ll/pzi0;->o()J

    .line 92
    .line 93
    .line 94
    move-result-wide v2

    .line 95
    long-to-double v2, v2

    .line 96
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 97
    .line 98
    invoke-static {}, Ll/pzi0;->o()J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    long-to-double v2, v2

    .line 103
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 104
    .line 105
    const-string v2, "default"

    .line 106
    .line 107
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 108
    .line 109
    iget v1, v1, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->receive:I

    .line 110
    .line 111
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 112
    .line 113
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 116
    .line 117
    new-instance v1, Ll/nq8;

    .line 118
    .line 119
    invoke-direct {v1, v0}, Ll/nq8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final synthetic o3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->clone()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->new_()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    const/4 v1, 0x0

    .line 26
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->receive:I

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->toJson()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 39
    .line 40
    iput v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 43
    .line 44
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/h;->R:Ll/byd0;

    .line 50
    .line 51
    invoke-static {}, Ll/pzi0;->o()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic p3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/kq8;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/kq8;-><init>(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic q3(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/rq8;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/rq8;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/sq8;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/sq8;-><init>(Lcom/p1/mobile/putong/core/api/h;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/iq8;

    .line 28
    .line 29
    invoke-direct {p1, p2}, Ll/iq8;-><init>(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic r3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-object p1
.end method

.method public final synthetic s3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic t3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/oq8;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/oq8;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/pq8;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/pq8;-><init>(Lcom/p1/mobile/putong/core/api/h;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public u3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "fake_conversation_profile_like_enter"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ll/hq8;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/hq8;-><init>(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public v3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qq8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/qq8;-><init>(Lcom/p1/mobile/putong/core/api/h;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    invoke-virtual {p0, p2, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public w3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mq8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/mq8;-><init>(Lcom/p1/mobile/putong/core/api/h;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
