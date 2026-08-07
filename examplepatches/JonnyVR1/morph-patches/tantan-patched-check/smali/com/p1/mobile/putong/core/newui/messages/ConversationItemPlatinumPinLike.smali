.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

.field public h:Lcom/p1/mobile/putong/core/api/c0$a;

.field public i:Ljava/lang/String;

.field public j:Ll/w30;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->l(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->o(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->k(Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->p(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private i()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "from_pin_like"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->j:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->relationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmpg-double v2, v0, v2

    .line 14
    .line 15
    if-gez v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-wide v2, 0x4194997000000000L    # 8.64E7

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    add-double/2addr v0, v2

    .line 24
    double-to-long v0, v0

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "ConversationPinLike_"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 33
    .line 34
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->e:Lv/VText;

    .line 46
    .line 47
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 50
    .line 51
    invoke-static {}, Ll/pzi0;->o()J

    .line 52
    .line 53
    .line 54
    move-result-wide v4

    .line 55
    sub-long v4, v0, v4

    .line 56
    .line 57
    invoke-virtual {v3, v4, v5}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    const-string v4, "%s \u540e\u5230\u671f"

    .line 66
    .line 67
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 77
    .line 78
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 79
    .line 80
    .line 81
    new-instance v2, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 82
    .line 83
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->h:Lcom/p1/mobile/putong/core/api/c0$a;

    .line 87
    .line 88
    const/4 v3, 0x1

    .line 89
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2, v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 104
    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->h:Lcom/p1/mobile/putong/core/api/c0$a;

    .line 111
    .line 112
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eb6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/pla;->l3(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 15

    .line 1
    const-string v0, "e_platinum_receive_top_like_match"

    .line 2
    .line 3
    const-string v1, "p_messages_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    new-instance v9, Ll/ab6;

    .line 13
    .line 14
    invoke-direct {v9, p0}, Ll/ab6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;)V

    .line 15
    .line 16
    .line 17
    new-instance v10, Ll/bb6;

    .line 18
    .line 19
    invoke-direct {v10}, Ll/bb6;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v11

    .line 30
    const/4 v13, 0x0

    .line 31
    const/4 v14, 0x0

    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v5, 0x0

    .line 34
    const/4 v6, 0x0

    .line 35
    const-string v7, ""

    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v12, 0x0

    .line 39
    move-object/from16 v3, p1

    .line 40
    .line 41
    invoke-static/range {v2 .. v14}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic o(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget p3, Lcom/p1/mobile/putong/core/R$string;->I7:I

    .line 12
    .line 13
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const-string p1, "e_platinum_receive_top_like_hide"

    .line 24
    .line 25
    const-string p2, "p_messages_view"

    .line 26
    .line 27
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->j()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->j:Ll/w30;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)Z
    .locals 4

    .line 1
    const-string p1, "e_platinum_receive_top_like_hide"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Lcom/p1/mobile/putong/core/R$string;->I7:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x1

    .line 19
    new-array v1, v0, [Ljava/lang/CharSequence;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    aput-object p1, v1, v2

    .line 23
    .line 24
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v1, Ll/w30$b;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    new-instance v3, Ll/cb6;

    .line 56
    .line 57
    invoke-direct {v3, p0}, Ll/cb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v2, Ll/db6;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Ll/db6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->j:Ll/w30;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 83
    .line 84
    .line 85
    return v0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;I)V
    .locals 2

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 4
    .line 5
    iget v0, p1, Ll/pla;->W:I

    .line 6
    .line 7
    if-ltz v0, :cond_5

    .line 8
    .line 9
    if-gt v0, p2, :cond_5

    .line 10
    .line 11
    iget v1, p1, Ll/pla;->X:I

    .line 12
    .line 13
    if-ltz v1, :cond_5

    .line 14
    .line 15
    if-ge v1, p2, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    sub-int/2addr p2, v0

    .line 20
    iget-object p1, p1, Ll/pla;->V:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_5

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ge v0, p2, :cond_1

    .line 33
    .line 34
    goto/16 :goto_1

    .line 35
    .line 36
    :cond_1
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 43
    .line 44
    if-eqz p1, :cond_5

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->g:Lcom/p1/mobile/putong/core/data/UserWithRelationShip;

    .line 55
    .line 56
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->relationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 57
    .line 58
    if-nez p2, :cond_2

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserWithRelationShip;->userId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    const-string p2, "e_platinum_receive_top_like_match"

    .line 75
    .line 76
    const-string v0, "p_messages_view"

    .line 77
    .line 78
    invoke-static {p2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->a:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->c:Lv/VText;

    .line 97
    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->d:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    const-string v0, "\u5979"

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    const-string v0, "\u4ed6"

    .line 115
    .line 116
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const-string v1, "%s\u559c\u6b22\u4e86\u4f60\uff0c\u914d\u5bf9\u9a6c\u4e0a\u5f00\u804a"

    .line 121
    .line 122
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->r()V

    .line 130
    .line 131
    .line 132
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->f:Landroid/widget/TextView;

    .line 133
    .line 134
    new-instance v0, Ll/xa6;

    .line 135
    .line 136
    invoke-direct {v0, p0, p1}, Ll/xa6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;Lcom/p1/mobile/putong/data/User;)V

    .line 137
    .line 138
    .line 139
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 140
    .line 141
    .line 142
    new-instance p1, Ll/ya6;

    .line 143
    .line 144
    invoke-direct {p1, p0}, Ll/ya6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 148
    .line 149
    .line 150
    new-instance p1, Ll/za6;

    .line 151
    .line 152
    invoke-direct {p1, p0}, Ll/za6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 156
    .line 157
    .line 158
    :cond_5
    :goto_1
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->e:Lv/VText;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    cmp-long p4, p6, p2

    .line 16
    .line 17
    if-gez p4, :cond_2

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->j()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 33
    .line 34
    sub-long/2addr p6, p2

    .line 35
    invoke-virtual {p0, p6, p7}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p2, "%s \u540e\u5230\u671f"

    .line 44
    .line 45
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
