.class public Ll/g900;
.super Ll/l900;
.source "SourceFile"


# instance fields
.field public e:J

.field public f:J

.field public g:Z

.field public h:Z

.field public i:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:I

.field public r:Ll/n100;

.field public s:Ll/clz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/clz<",
            "**>;"
        }
    .end annotation
.end field

.field public t:Z

.field public u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Ll/clz;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/l900;-><init>(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/g900;->e:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/g900;->f:J

    .line 9
    .line 10
    new-instance p1, Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/g900;->i:Ljava/util/Set;

    .line 16
    .line 17
    new-instance p1, Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/g900;->j:Ljava/util/Set;

    .line 23
    .line 24
    new-instance p1, Ljava/util/HashSet;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/g900;->k:Ljava/util/Set;

    .line 30
    .line 31
    new-instance p1, Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/g900;->l:Ljava/util/Set;

    .line 37
    .line 38
    new-instance p1, Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/g900;->m:Ljava/util/Set;

    .line 44
    .line 45
    new-instance p1, Ljava/util/HashSet;

    .line 46
    .line 47
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/g900;->n:Ljava/util/Set;

    .line 51
    .line 52
    new-instance p1, Ljava/util/HashSet;

    .line 53
    .line 54
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ll/g900;->o:Ljava/util/Set;

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    iput-boolean p1, p0, Ll/g900;->p:Z

    .line 61
    .line 62
    iput p1, p0, Ll/g900;->q:I

    .line 63
    .line 64
    new-instance v0, Ll/n100;

    .line 65
    .line 66
    invoke-direct {v0}, Ll/n100;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/g900;->r:Ll/n100;

    .line 70
    .line 71
    iput-boolean p1, p0, Ll/g900;->t:Z

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    const/4 v0, 0x5

    .line 76
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Ll/g900;->u:Ljava/util/List;

    .line 80
    .line 81
    iput-object p2, p0, Ll/g900;->s:Ll/clz;

    .line 82
    .line 83
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/UserStatus;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "RISK_TAG_CHAT_MESSAGE_SAFETY_REMINDER"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic B(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g900;->Z(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bgm;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Literatures;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Ll/bgm;->e(Ljava/lang/String;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v2, p0}, Ll/bgm;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v2, Ll/f900;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/f900;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1, p0, v2}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic D(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g900;->Y(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/data/Message;Ll/bkj0;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ljava/util/Collection;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    move-object v1, v3

    .line 35
    :goto_1
    iget-object v4, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v4, Ljava/util/Collection;

    .line 38
    .line 39
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-nez v4, :cond_3

    .line 44
    .line 45
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    move-object v3, p1

    .line 54
    check-cast v3, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 55
    .line 56
    :cond_3
    new-instance p1, Ll/pf60;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v2, "artwork_message_sent_from_me"

    .line 67
    .line 68
    invoke-direct {p1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Ll/pf60;

    .line 72
    .line 73
    const-string v2, "artwork_status"

    .line 74
    .line 75
    invoke-static {v3, v1}, Ll/bgm;->a(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-direct {p0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/pf60;

    .line 83
    .line 84
    const-string v2, "artwork_title"

    .line 85
    .line 86
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 87
    .line 88
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ll/pf60;

    .line 92
    .line 93
    const-string v3, "artwork_type"

    .line 94
    .line 95
    invoke-static {v0}, Ll/bgm;->b(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    filled-new-array {p1, p0, v1, v2}, [Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string p1, "e_chat_artwork_message"

    .line 107
    .line 108
    const-string v0, "p_chat_view"

    .line 109
    .line 110
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 2
    .line 3
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 4
    .line 5
    sub-double/2addr v0, p0

    .line 6
    double-to-int p0, v0

    .line 7
    return p0
.end method

.method public static bridge synthetic G(Ll/g900;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    return-object p0
.end method

.method public static N(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/MessageTipsContent;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 5
    .line 6
    if-eqz v1, :cond_3

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 14
    .line 15
    const-string v2, "love_letter"

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    :goto_0
    return-object v0
.end method

.method private U(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x2af8

    .line 11
    .line 12
    if-lt p2, v0, :cond_0

    .line 13
    .line 14
    sub-int/2addr p2, v0

    .line 15
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget v0, Ll/qec0;->e:I

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;

    .line 36
    .line 37
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    sget v0, Ll/bnl0;->e:I

    .line 40
    .line 41
    sget v2, Ll/bnl0;->f:I

    .line 42
    .line 43
    invoke-direct {p1, v0, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_0
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    const/16 v0, 0x2710

    .line 59
    .line 60
    if-lt p2, v0, :cond_1

    .line 61
    .line 62
    sub-int/2addr p2, v0

    .line 63
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget v0, Ll/qec0;->n:I

    .line 78
    .line 79
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

    .line 84
    .line 85
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    sget v0, Ll/bnl0;->e:I

    .line 88
    .line 89
    sget v2, Ll/bnl0;->f:I

    .line 90
    .line 91
    invoke-direct {p1, v0, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_1
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_2

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    const/16 v0, 0x1f40

    .line 121
    .line 122
    if-lt p2, v0, :cond_2

    .line 123
    .line 124
    sub-int/2addr p2, v0

    .line 125
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    sget v0, Ll/qec0;->T0:I

    .line 140
    .line 141
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockLayout;

    .line 146
    .line 147
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 148
    .line 149
    sget v0, Ll/bnl0;->e:I

    .line 150
    .line 151
    sget v2, Ll/bnl0;->f:I

    .line 152
    .line 153
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .line 158
    .line 159
    return-object p0

    .line 160
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_3

    .line 173
    .line 174
    const/16 v0, 0x1b58

    .line 175
    .line 176
    if-lt p2, v0, :cond_3

    .line 177
    .line 178
    sub-int/2addr p2, v0

    .line 179
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 184
    .line 185
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    sget v0, Ll/qec0;->o:I

    .line 194
    .line 195
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatUnlockLayout;

    .line 200
    .line 201
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 202
    .line 203
    sget v0, Ll/bnl0;->e:I

    .line 204
    .line 205
    sget v2, Ll/bnl0;->f:I

    .line 206
    .line 207
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 211
    .line 212
    .line 213
    return-object p0

    .line 214
    :cond_3
    const/16 v0, 0x1388

    .line 215
    .line 216
    if-lt p2, v0, :cond_4

    .line 217
    .line 218
    sub-int/2addr p2, v0

    .line 219
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object p2

    .line 223
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 224
    .line 225
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    sget v0, Ll/qec0;->l:I

    .line 234
    .line 235
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;

    .line 240
    .line 241
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 242
    .line 243
    sget v0, Ll/bnl0;->e:I

    .line 244
    .line 245
    sget v2, Ll/bnl0;->f:I

    .line 246
    .line 247
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 251
    .line 252
    .line 253
    return-object p0

    .line 254
    :cond_4
    const/16 v0, 0x7d0

    .line 255
    .line 256
    if-lt p2, v0, :cond_5

    .line 257
    .line 258
    sub-int/2addr p2, v0

    .line 259
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 264
    .line 265
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    sget v0, Ll/qec0;->Q5:I

    .line 274
    .line 275
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;

    .line 280
    .line 281
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 282
    .line 283
    sget v0, Ll/bnl0;->e:I

    .line 284
    .line 285
    sget v2, Ll/bnl0;->f:I

    .line 286
    .line 287
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 291
    .line 292
    .line 293
    return-object p0

    .line 294
    :cond_5
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 295
    .line 296
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    const/16 v2, 0x3e8

    .line 301
    .line 302
    if-nez v0, :cond_6

    .line 303
    .line 304
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-eqz v0, :cond_6

    .line 317
    .line 318
    if-lt p2, v2, :cond_6

    .line 319
    .line 320
    sub-int/2addr p2, v2

    .line 321
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 326
    .line 327
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    sget v0, Ll/qec0;->f4:I

    .line 336
    .line 337
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    check-cast p0, Landroid/view/ViewGroup;

    .line 342
    .line 343
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 344
    .line 345
    sget v0, Ll/bnl0;->e:I

    .line 346
    .line 347
    sget v2, Ll/bnl0;->f:I

    .line 348
    .line 349
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 353
    .line 354
    .line 355
    return-object p0

    .line 356
    :cond_6
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 357
    .line 358
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    if-nez v0, :cond_7

    .line 363
    .line 364
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-eqz v0, :cond_7

    .line 377
    .line 378
    if-lt p2, v2, :cond_7

    .line 379
    .line 380
    sub-int/2addr p2, v2

    .line 381
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 382
    .line 383
    .line 384
    move-result-object p2

    .line 385
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 386
    .line 387
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 388
    .line 389
    .line 390
    move-result-object p0

    .line 391
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    sget v0, Ll/qec0;->U0:I

    .line 396
    .line 397
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    check-cast p0, Landroid/view/ViewGroup;

    .line 402
    .line 403
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 404
    .line 405
    sget v0, Ll/bnl0;->e:I

    .line 406
    .line 407
    sget v2, Ll/bnl0;->f:I

    .line 408
    .line 409
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {p0, p2, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 413
    .line 414
    .line 415
    return-object p0

    .line 416
    :cond_7
    invoke-virtual {p0, p1, p2}, Ll/g900;->O(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    return-object p0
.end method


# virtual methods
.method public final H(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    const-string p0, "(^[^ :\uff1a]+[ :\uff1a]).+"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v0, Ll/g9c0;->E:I

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {p1, p0, v0, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    return-object p1
.end method

.method public final I(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 9
    .line 10
    const-string v2, "moment_user_state"

    .line 11
    .line 12
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    return v2

    .line 27
    :cond_1
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/StateData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/data/StateData;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 58
    .line 59
    if-lt p0, v2, :cond_2

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StateData;->emotionId:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    move v0, v2

    .line 96
    :cond_2
    :goto_1
    return v0
.end method

.method public final J(I)Z
    .locals 0

    .line 1
    const/16 p0, 0x74

    .line 2
    .line 3
    if-eq p1, p0, :cond_2

    .line 4
    .line 5
    const/16 p0, 0x76

    .line 6
    .line 7
    if-lt p1, p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x7e

    .line 10
    .line 11
    if-le p1, p0, :cond_2

    .line 12
    .line 13
    :cond_0
    const/16 p0, 0x7f

    .line 14
    .line 15
    if-eq p1, p0, :cond_2

    .line 16
    .line 17
    const/16 p0, 0x80

    .line 18
    .line 19
    if-eq p1, p0, :cond_2

    .line 20
    .line 21
    const/16 p0, 0xb5

    .line 22
    .line 23
    if-eq p1, p0, :cond_2

    .line 24
    .line 25
    const/16 p0, 0x3b

    .line 26
    .line 27
    if-eq p1, p0, :cond_2

    .line 28
    .line 29
    const/16 p0, 0xb2

    .line 30
    .line 31
    if-eq p1, p0, :cond_2

    .line 32
    .line 33
    const/16 p0, 0xb9

    .line 34
    .line 35
    if-eq p1, p0, :cond_2

    .line 36
    .line 37
    const/16 p0, 0xbb

    .line 38
    .line 39
    if-eq p1, p0, :cond_2

    .line 40
    .line 41
    const/16 p0, 0x41

    .line 42
    .line 43
    if-eq p1, p0, :cond_2

    .line 44
    .line 45
    const/16 p0, 0xbd

    .line 46
    .line 47
    if-eq p1, p0, :cond_2

    .line 48
    .line 49
    const/16 p0, 0x109

    .line 50
    .line 51
    if-eq p1, p0, :cond_2

    .line 52
    .line 53
    const/16 p0, 0xbf

    .line 54
    .line 55
    if-eq p1, p0, :cond_2

    .line 56
    .line 57
    const/16 p0, 0xf5

    .line 58
    .line 59
    if-eq p1, p0, :cond_2

    .line 60
    .line 61
    const/16 p0, 0x10f

    .line 62
    .line 63
    if-eq p1, p0, :cond_2

    .line 64
    .line 65
    const/16 p0, 0xff

    .line 66
    .line 67
    if-eq p1, p0, :cond_2

    .line 68
    .line 69
    const/16 p0, 0x115

    .line 70
    .line 71
    if-eq p1, p0, :cond_2

    .line 72
    .line 73
    const/16 p0, 0x111

    .line 74
    .line 75
    if-eq p1, p0, :cond_2

    .line 76
    .line 77
    const/16 p0, 0x119

    .line 78
    .line 79
    if-ne p1, p0, :cond_1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    const/4 p0, 0x0

    .line 83
    return p0

    .line 84
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 85
    return p0
.end method

.method public K(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isAiStory(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreAiStoryShareStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAiStoryShareStatus;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAiStoryShareStatus;->shareStatus:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    return-object p0

    .line 42
    :catch_0
    move-exception p1

    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object p0
.end method

.method public final L(Landroid/view/View;I)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    check-cast p1, Landroid/view/ViewGroup;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v4, ":"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    add-int/lit8 v3, p2, 0x1

    .line 55
    .line 56
    invoke-virtual {p0, v2, v3}, Ll/g900;->L(Landroid/view/View;I)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    return-object v0
.end method

.method public final M(Lcom/p1/mobile/putong/core/data/Message;I)I
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ChallengeMsgList;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChallengeMsgList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_5

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsgList;->msgData:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_5

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsgList;->msgData:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ll/g900;->P(Ljava/util/List;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, -0x1

    .line 28
    if-eq v1, v2, :cond_0

    .line 29
    .line 30
    return v1

    .line 31
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1, v0, p1}, Ll/r97;->y5(Lcom/p1/mobile/putong/core/data/ChallengeMsgList;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_6

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->type:Ljava/lang/String;

    .line 50
    .line 51
    const-string v2, "stripes"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->type:Ljava/lang/String;

    .line 60
    .line 61
    const-string v2, "stripes_without_button"

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    :cond_1
    const/16 p2, 0xd7

    .line 70
    .line 71
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->type:Ljava/lang/String;

    .line 72
    .line 73
    const-string v2, "user_info_card"

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    const/16 p2, 0xd9

    .line 82
    .line 83
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->type:Ljava/lang/String;

    .line 84
    .line 85
    const-string v2, "normal_card"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_6

    .line 92
    .line 93
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_4

    .line 108
    .line 109
    const/16 p2, 0xd8

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_4
    const/16 p2, 0x56

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    const/4 v0, 0x0

    .line 116
    :cond_6
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 117
    .line 118
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_7

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_7

    .line 131
    .line 132
    iget-boolean p1, p0, Ll/g900;->t:Z

    .line 133
    .line 134
    const/16 p2, 0x8c

    .line 135
    .line 136
    if-nez p1, :cond_7

    .line 137
    .line 138
    const/4 p1, 0x1

    .line 139
    iput-boolean p1, p0, Ll/g900;->t:Z

    .line 140
    .line 141
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_7

    .line 146
    .line 147
    const-string p0, "in_harmony_test_string"

    .line 148
    .line 149
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->eventlog:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    filled-new-array {p0}, [Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    const-string p1, "e_recall_message_notice"

    .line 160
    .line 161
    const-string v0, "p_chat_view"

    .line 162
    .line 163
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 164
    .line 165
    .line 166
    :cond_7
    return p2
.end method

.method public final O(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    const/16 v3, 0x8c

    .line 8
    .line 9
    const/16 v4, 0x9a

    .line 10
    .line 11
    const/16 v5, 0x9b

    .line 12
    .line 13
    const/16 v6, 0x1c

    .line 14
    .line 15
    const/16 v7, 0x1d

    .line 16
    .line 17
    const/16 v8, 0x27

    .line 18
    .line 19
    const/16 v9, 0x5b

    .line 20
    .line 21
    const/16 v10, 0x16

    .line 22
    .line 23
    const/4 v11, 0x1

    .line 24
    const/4 v12, 0x0

    .line 25
    const/16 v13, 0x8d

    .line 26
    .line 27
    if-eq v2, v13, :cond_11

    .line 28
    .line 29
    if-eq v2, v10, :cond_11

    .line 30
    .line 31
    if-eq v2, v11, :cond_11

    .line 32
    .line 33
    if-eq v2, v9, :cond_11

    .line 34
    .line 35
    if-eq v2, v8, :cond_11

    .line 36
    .line 37
    if-eq v2, v7, :cond_11

    .line 38
    .line 39
    if-eq v2, v6, :cond_11

    .line 40
    .line 41
    if-eq v2, v5, :cond_11

    .line 42
    .line 43
    if-eq v2, v4, :cond_11

    .line 44
    .line 45
    const/16 v14, 0x46

    .line 46
    .line 47
    if-ne v2, v14, :cond_0

    .line 48
    .line 49
    goto/16 :goto_9

    .line 50
    .line 51
    :cond_0
    const/16 v4, 0xde

    .line 52
    .line 53
    const/16 v5, 0xe3

    .line 54
    .line 55
    const/16 v6, 0xcb

    .line 56
    .line 57
    const/16 v7, 0x94

    .line 58
    .line 59
    const/16 v8, 0x95

    .line 60
    .line 61
    const/16 v9, 0x8e

    .line 62
    .line 63
    const/16 v10, 0x11

    .line 64
    .line 65
    const/16 v11, 0xe2

    .line 66
    .line 67
    const/16 v13, 0xca

    .line 68
    .line 69
    const/16 v14, 0x8f

    .line 70
    .line 71
    const/16 v15, 0x90

    .line 72
    .line 73
    if-eq v2, v9, :cond_5

    .line 74
    .line 75
    if-eq v2, v15, :cond_5

    .line 76
    .line 77
    if-eq v2, v14, :cond_5

    .line 78
    .line 79
    const/16 v9, 0x93

    .line 80
    .line 81
    if-eq v2, v9, :cond_5

    .line 82
    .line 83
    if-eq v2, v8, :cond_5

    .line 84
    .line 85
    if-eq v2, v7, :cond_5

    .line 86
    .line 87
    if-eq v2, v6, :cond_5

    .line 88
    .line 89
    if-eq v2, v13, :cond_5

    .line 90
    .line 91
    if-eq v2, v5, :cond_5

    .line 92
    .line 93
    if-eq v2, v11, :cond_5

    .line 94
    .line 95
    if-ne v2, v4, :cond_1

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :cond_1
    const/16 v3, 0xbd

    .line 100
    .line 101
    const/16 v4, 0x74

    .line 102
    .line 103
    if-ne v2, v3, :cond_2

    .line 104
    .line 105
    iget-object v2, v0, Ll/g900;->s:Ll/clz;

    .line 106
    .line 107
    invoke-virtual {v2}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    sget v3, Ll/qec0;->K4:I

    .line 116
    .line 117
    invoke-virtual {v2, v3, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    check-cast v2, Landroid/widget/LinearLayout;

    .line 122
    .line 123
    invoke-virtual {v2, v12}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 124
    .line 125
    .line 126
    iget-object v3, v0, Ll/g900;->s:Ll/clz;

    .line 127
    .line 128
    invoke-virtual {v3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    sget v5, Ll/qec0;->p1:I

    .line 137
    .line 138
    invoke-virtual {v3, v5, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v2, v4}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sget v3, Ll/bnl0;->e:I

    .line 147
    .line 148
    sget v4, Ll/bnl0;->f:I

    .line 149
    .line 150
    invoke-virtual {v2, v0, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 151
    .line 152
    .line 153
    sget v0, Ll/bnl0;->e:I

    .line 154
    .line 155
    sget v3, Ll/bnl0;->f:I

    .line 156
    .line 157
    invoke-virtual {v2, v1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 158
    .line 159
    .line 160
    return-object v2

    .line 161
    :cond_2
    const/16 v3, 0x109

    .line 162
    .line 163
    if-ne v2, v3, :cond_3

    .line 164
    .line 165
    iget-object v2, v0, Ll/g900;->s:Ll/clz;

    .line 166
    .line 167
    invoke-virtual {v2}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    sget v3, Ll/qec0;->K4:I

    .line 176
    .line 177
    invoke-virtual {v2, v3, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Landroid/widget/LinearLayout;

    .line 182
    .line 183
    invoke-virtual {v2, v12}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 184
    .line 185
    .line 186
    iget-object v3, v0, Ll/g900;->s:Ll/clz;

    .line 187
    .line 188
    invoke-virtual {v3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    sget v5, Ll/qec0;->R0:I

    .line 197
    .line 198
    invoke-virtual {v3, v5, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v0, v2, v4}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    sget v3, Ll/bnl0;->e:I

    .line 207
    .line 208
    sget v4, Ll/bnl0;->f:I

    .line 209
    .line 210
    invoke-virtual {v2, v0, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 211
    .line 212
    .line 213
    sget v0, Ll/bnl0;->e:I

    .line 214
    .line 215
    sget v3, Ll/bnl0;->f:I

    .line 216
    .line 217
    invoke-virtual {v2, v1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 218
    .line 219
    .line 220
    return-object v2

    .line 221
    :cond_3
    const/16 v3, 0x44

    .line 222
    .line 223
    if-ne v2, v3, :cond_4

    .line 224
    .line 225
    new-instance v1, Lv/VText;

    .line 226
    .line 227
    iget-object v0, v0, Ll/g900;->s:Ll/clz;

    .line 228
    .line 229
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-direct {v1, v0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 234
    .line 235
    .line 236
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 237
    .line 238
    sget v2, Ll/bnl0;->e:I

    .line 239
    .line 240
    const/high16 v3, 0x42480000    # 50.0f

    .line 241
    .line 242
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    invoke-direct {v0, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setGravity(I)V

    .line 253
    .line 254
    .line 255
    return-object v1

    .line 256
    :cond_4
    invoke-virtual/range {p0 .. p2}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    return-object v0

    .line 261
    :cond_5
    :goto_0
    iget-object v9, v0, Ll/g900;->s:Ll/clz;

    .line 262
    .line 263
    invoke-virtual {v9}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 264
    .line 265
    .line 266
    move-result-object v9

    .line 267
    invoke-virtual {v9}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 268
    .line 269
    .line 270
    move-result-object v9

    .line 271
    sget v10, Ll/qec0;->K4:I

    .line 272
    .line 273
    invoke-virtual {v9, v10, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v9

    .line 277
    check-cast v9, Landroid/widget/LinearLayout;

    .line 278
    .line 279
    if-eq v2, v14, :cond_d

    .line 280
    .line 281
    if-ne v2, v7, :cond_6

    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_6
    if-eq v2, v15, :cond_c

    .line 285
    .line 286
    if-ne v2, v8, :cond_7

    .line 287
    .line 288
    goto :goto_3

    .line 289
    :cond_7
    if-eq v2, v13, :cond_b

    .line 290
    .line 291
    if-ne v2, v6, :cond_8

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_8
    if-eq v2, v11, :cond_a

    .line 295
    .line 296
    if-ne v2, v5, :cond_9

    .line 297
    .line 298
    goto :goto_1

    .line 299
    :cond_9
    invoke-virtual {v0, v9, v12}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    goto :goto_5

    .line 304
    :cond_a
    :goto_1
    const/16 v3, 0x5a

    .line 305
    .line 306
    invoke-virtual {v0, v9, v3}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    goto :goto_5

    .line 311
    :cond_b
    :goto_2
    const/16 v3, 0x45

    .line 312
    .line 313
    invoke-virtual {v0, v9, v3}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    goto :goto_5

    .line 318
    :cond_c
    :goto_3
    invoke-virtual {v0, v9, v3}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    goto :goto_5

    .line 323
    :cond_d
    :goto_4
    const/16 v3, 0x43

    .line 324
    .line 325
    invoke-virtual {v0, v9, v3}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    :goto_5
    sget v5, Ll/bnl0;->e:I

    .line 330
    .line 331
    sget v6, Ll/bnl0;->f:I

    .line 332
    .line 333
    invoke-virtual {v9, v3, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 334
    .line 335
    .line 336
    new-instance v3, Lv/VText;

    .line 337
    .line 338
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    invoke-direct {v3, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 343
    .line 344
    .line 345
    const/16 v1, 0x8e

    .line 346
    .line 347
    if-eq v2, v1, :cond_f

    .line 348
    .line 349
    if-eq v2, v14, :cond_f

    .line 350
    .line 351
    if-eq v2, v15, :cond_f

    .line 352
    .line 353
    if-eq v2, v13, :cond_f

    .line 354
    .line 355
    if-eq v2, v11, :cond_f

    .line 356
    .line 357
    if-ne v2, v4, :cond_e

    .line 358
    .line 359
    goto :goto_6

    .line 360
    :cond_e
    iget-object v1, v0, Ll/g900;->s:Ll/clz;

    .line 361
    .line 362
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->l3:I

    .line 367
    .line 368
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    invoke-virtual {v0, v1}, Ll/g900;->H(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 377
    .line 378
    .line 379
    goto :goto_7

    .line 380
    :cond_f
    :goto_6
    iget-object v1, v0, Ll/g900;->s:Ll/clz;

    .line 381
    .line 382
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->k3:I

    .line 387
    .line 388
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    invoke-virtual {v0, v1}, Ll/g900;->H(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 397
    .line 398
    .line 399
    :goto_7
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 400
    .line 401
    const/4 v2, -0x2

    .line 402
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 403
    .line 404
    .line 405
    const/16 v2, 0x11

    .line 406
    .line 407
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 408
    .line 409
    iget-object v0, v0, Ll/g900;->s:Ll/clz;

    .line 410
    .line 411
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 420
    .line 421
    .line 422
    move-result-object v2

    .line 423
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 424
    .line 425
    .line 426
    move-result v2

    .line 427
    if-eqz v2, :cond_10

    .line 428
    .line 429
    sget v2, Ll/g9c0;->i:I

    .line 430
    .line 431
    goto :goto_8

    .line 432
    :cond_10
    sget v2, Ll/g9c0;->H:I

    .line 433
    .line 434
    :goto_8
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 439
    .line 440
    .line 441
    const/high16 v0, 0x41500000    # 13.0f

    .line 442
    .line 443
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 444
    .line 445
    .line 446
    sget v0, Ll/qa00;->y:I

    .line 447
    .line 448
    const/high16 v2, 0x41800000    # 16.0f

    .line 449
    .line 450
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    invoke-virtual {v1, v0, v12, v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 455
    .line 456
    .line 457
    const/16 v2, 0x11

    .line 458
    .line 459
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 460
    .line 461
    .line 462
    sget v0, Ll/qa00;->h:I

    .line 463
    .line 464
    sget v2, Ll/qa00;->g:I

    .line 465
    .line 466
    invoke-virtual {v3, v0, v2, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v9, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    .line 471
    .line 472
    return-object v9

    .line 473
    :cond_11
    :goto_9
    iget-object v14, v0, Ll/g900;->s:Ll/clz;

    .line 474
    .line 475
    invoke-virtual {v14}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 476
    .line 477
    .line 478
    move-result-object v14

    .line 479
    invoke-virtual {v14}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 480
    .line 481
    .line 482
    move-result-object v14

    .line 483
    sget v15, Ll/qec0;->K4:I

    .line 484
    .line 485
    invoke-virtual {v14, v15, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v1

    .line 489
    check-cast v1, Landroid/widget/LinearLayout;

    .line 490
    .line 491
    invoke-virtual {v1, v12}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 492
    .line 493
    .line 494
    iget-object v14, v0, Ll/g900;->s:Ll/clz;

    .line 495
    .line 496
    invoke-virtual {v14}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 497
    .line 498
    .line 499
    move-result-object v14

    .line 500
    invoke-virtual {v14}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 501
    .line 502
    .line 503
    move-result-object v14

    .line 504
    if-eq v2, v13, :cond_13

    .line 505
    .line 506
    if-eq v2, v10, :cond_13

    .line 507
    .line 508
    if-eq v2, v11, :cond_13

    .line 509
    .line 510
    if-eq v2, v9, :cond_13

    .line 511
    .line 512
    if-ne v2, v8, :cond_12

    .line 513
    .line 514
    goto :goto_a

    .line 515
    :cond_12
    sget v8, Ll/qec0;->x5:I

    .line 516
    .line 517
    goto :goto_b

    .line 518
    :cond_13
    :goto_a
    sget v8, Ll/qec0;->y5:I

    .line 519
    .line 520
    :goto_b
    invoke-virtual {v14, v8, v1, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 521
    .line 522
    .line 523
    move-result-object v8

    .line 524
    if-eq v2, v7, :cond_16

    .line 525
    .line 526
    if-ne v2, v6, :cond_14

    .line 527
    .line 528
    goto :goto_c

    .line 529
    :cond_14
    if-eq v2, v5, :cond_17

    .line 530
    .line 531
    if-ne v2, v4, :cond_15

    .line 532
    .line 533
    goto :goto_d

    .line 534
    :cond_15
    add-int/lit8 v3, v2, -0x1

    .line 535
    .line 536
    goto :goto_d

    .line 537
    :cond_16
    :goto_c
    move v3, v12

    .line 538
    :cond_17
    :goto_d
    invoke-virtual {v0, v1, v3}, Ll/g900;->T(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 539
    .line 540
    .line 541
    move-result-object v0

    .line 542
    sget v2, Ll/bnl0;->e:I

    .line 543
    .line 544
    sget v3, Ll/bnl0;->f:I

    .line 545
    .line 546
    invoke-virtual {v1, v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 547
    .line 548
    .line 549
    sget v0, Ll/bnl0;->e:I

    .line 550
    .line 551
    sget v2, Ll/bnl0;->f:I

    .line 552
    .line 553
    invoke-virtual {v1, v8, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 554
    .line 555
    .line 556
    return-object v1
.end method

.method public final P(Ljava/util/List;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChallengeMsg;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->type:Ljava/lang/String;

    .line 9
    .line 10
    const-string p1, "middle_text"

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/16 p0, 0xf0

    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, -0x1

    .line 22
    return p0
.end method

.method public Q(Lcom/p1/mobile/putong/core/data/Message;I)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x8c

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/g900;->R(Lcom/p1/mobile/putong/core/data/Message;I)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v1, "fake_id_"

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_3

    .line 49
    .line 50
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 51
    .line 52
    const/4 v2, 0x5

    .line 53
    if-eq v0, v2, :cond_2

    .line 54
    .line 55
    const/4 v2, 0x7

    .line 56
    if-eq v0, v2, :cond_2

    .line 57
    .line 58
    const/4 v2, 0x6

    .line 59
    if-eq v0, v2, :cond_2

    .line 60
    .line 61
    const/16 v2, 0x8

    .line 62
    .line 63
    if-ne v0, v2, :cond_4

    .line 64
    .line 65
    :cond_2
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    :cond_3
    add-int/lit16 p2, p2, 0x7d0

    .line 74
    .line 75
    return p2

    .line 76
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 77
    .line 78
    const-string v1, "group"

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_5

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_5

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 109
    .line 110
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 111
    .line 112
    invoke-interface {v0, v1, v2}, Ll/r97;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_5

    .line 117
    .line 118
    add-int/lit16 p2, p2, 0x3e8

    .line 119
    .line 120
    return p2

    .line 121
    :cond_5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 122
    .line 123
    if-nez v0, :cond_f

    .line 124
    .line 125
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 126
    .line 127
    if-eqz v0, :cond_6

    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_8

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 156
    .line 157
    invoke-interface {v0, v1, v2}, Ll/r97;->e1(Ljava/lang/String;Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_7

    .line 162
    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 174
    .line 175
    invoke-interface {v0, v1, v2}, Ll/r97;->r3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-nez v0, :cond_7

    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 192
    .line 193
    invoke-interface {v0, v1, v2}, Ll/r97;->l4(Ljava/lang/String;Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_8

    .line 198
    .line 199
    :cond_7
    add-int/lit16 p2, p2, 0x1b58

    .line 200
    .line 201
    return p2

    .line 202
    :cond_8
    invoke-virtual {p0, p1}, Ll/g900;->V(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_a

    .line 207
    .line 208
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 209
    .line 210
    if-eqz v0, :cond_9

    .line 211
    .line 212
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_a

    .line 217
    .line 218
    :cond_9
    add-int/lit16 p2, p2, 0x2328

    .line 219
    .line 220
    return p2

    .line 221
    :cond_a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-eqz v0, :cond_b

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 244
    .line 245
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 246
    .line 247
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Jp(Ljava/lang/String;Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_b

    .line 252
    .line 253
    add-int/lit16 p2, p2, 0x1f40

    .line 254
    .line 255
    return p2

    .line 256
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-eqz v0, :cond_c

    .line 269
    .line 270
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 279
    .line 280
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 281
    .line 282
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->gh(Ljava/lang/String;Ljava/lang/String;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-eqz v0, :cond_c

    .line 287
    .line 288
    add-int/lit16 p2, p2, 0x3e8

    .line 289
    .line 290
    return p2

    .line 291
    :cond_c
    invoke-virtual {p0, p1}, Ll/g900;->X(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-eqz v0, :cond_d

    .line 296
    .line 297
    add-int/lit16 p2, p2, 0x2710

    .line 298
    .line 299
    return p2

    .line 300
    :cond_d
    invoke-virtual {p0, p1}, Ll/g900;->W(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    if-eqz p0, :cond_e

    .line 305
    .line 306
    add-int/lit16 p2, p2, 0x2af8

    .line 307
    .line 308
    :cond_e
    return p2

    .line 309
    :cond_f
    :goto_0
    add-int/lit16 p2, p2, 0x1388

    .line 310
    .line 311
    return p2
.end method

.method public final R(Lcom/p1/mobile/putong/core/data/Message;I)I
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    .line 1
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    const/16 v3, 0x74

    goto :goto_0

    :cond_0
    move v3, v5

    .line 2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v6

    invoke-virtual {v6}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v6

    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-interface {v6, v7}, Ll/r97;->z(Ljava/lang/String;)Z

    move-result v6

    const/16 v7, 0x30

    const/16 v8, 0x31

    const-string v9, "exchange_picture"

    if-nez v6, :cond_1

    .line 3
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    move-result-object v6

    iget-object v10, v0, Ll/g900;->s:Ll/clz;

    .line 4
    invoke-virtual {v10}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v10

    invoke-virtual {v6, v10}, Ll/o3z;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    move-result v6

    if-eqz v6, :cond_4

    :cond_1
    if-nez v3, :cond_4

    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 5
    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 6
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 8
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    if-nez v0, :cond_2

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    if-eqz v0, :cond_3

    :cond_2
    add-int/2addr v3, v8

    return v3

    :cond_3
    add-int/2addr v3, v7

    return v3

    .line 9
    :cond_4
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "picture_compliment"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_5

    const/16 v0, 0x119

    return v0

    :cond_5
    const/16 v0, 0x73

    return v0

    .line 11
    :cond_6
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "local_platinum_pin_guide"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    const/16 v0, 0x101

    return v0

    .line 12
    :cond_7
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "local_o_diamond_visitor_guide"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    const/16 v0, 0x10b

    return v0

    .line 13
    :cond_8
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "local_ux_questionnaire"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    const/16 v0, 0x10c

    return v0

    .line 14
    :cond_9
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "local_wechat_notify_guide"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    const/16 v0, 0x10a

    return v0

    .line 15
    :cond_a
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "local_long_time_no_see"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_b

    const/16 v0, 0x102

    return v0

    .line 16
    :cond_b
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "common_tip_box"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    const/16 v0, 0x108

    return v0

    .line 17
    :cond_c
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "common_tip_box_v2"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const/16 v10, 0x35

    if-eqz v6, :cond_d

    return v10

    .line 18
    :cond_d
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v11, "mm_task"

    invoke-static {v6, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e

    return v10

    .line 19
    :cond_e
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v11, "ai_chat_analysis"

    invoke-static {v6, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_f

    const/16 v0, 0x113

    return v0

    .line 20
    :cond_f
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v11, "ai_chat_analysis_guide"

    invoke-static {v6, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_10

    const/16 v0, 0x116

    return v0

    .line 21
    :cond_10
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v11, "prologue"

    invoke-static {v6, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const/16 v11, 0x8c

    if-eqz v6, :cond_13

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 23
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_11

    return v11

    :cond_11
    const/16 v0, 0x115

    return v0

    :cond_12
    const/16 v0, 0x72

    return v0

    .line 24
    :cond_13
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "wanwan_invite"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_15

    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_14

    const/16 v0, 0xcc

    return v0

    :cond_14
    const/16 v0, 0x57

    return v0

    .line 26
    :cond_15
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "wanwan_tip"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_16

    const/16 v0, 0xdb

    return v0

    .line 27
    :cond_16
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "local_friend_active_remind_female"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_17

    const/16 v0, 0xf9

    return v0

    .line 28
    :cond_17
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "continuous_chat_tip"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_18

    const/16 v0, 0xfc

    return v0

    .line 29
    :cond_18
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "female_unreply_reminder"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_19

    const/16 v0, 0xfa

    return v0

    .line 30
    :cond_19
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "voice_call_invitation"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1a

    const/16 v0, 0xc0

    return v0

    .line 31
    :cond_1a
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "local_visitor_hide_footprint"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1b

    const/16 v0, 0x105

    return v0

    .line 32
    :cond_1b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "operation"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 33
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_1

    :cond_1c
    return v11

    :cond_1d
    :goto_1
    const/16 v0, 0x39

    return v0

    .line 34
    :cond_1e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "live_vip_greet"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1f

    const/16 v0, 0x38

    return v0

    .line 35
    :cond_1f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "ai_story_text"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_20

    return v5

    .line 36
    :cond_20
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "christmas_match"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_21

    const/16 v0, 0xc6

    return v0

    .line 37
    :cond_21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "chat_gift"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const/4 v12, 0x1

    if-nez v6, :cond_22

    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "moment_gift"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_23

    :cond_22
    move v4, v5

    goto/16 :goto_29

    .line 39
    :cond_23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "moment_notification"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_24

    return v10

    .line 40
    :cond_24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "local_countdown_like_notify"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_25

    const/16 v0, 0xc2

    return v0

    .line 41
    :cond_25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "local_countdown_like_success"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_26

    const/16 v0, 0xc3

    return v0

    .line 42
    :cond_26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "heartbeat_notify"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_27

    const/16 v0, 0xcf

    return v0

    .line 43
    :cond_27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "heartbeat_waiting_response"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_28

    const/16 v0, 0xd0

    return v0

    .line 44
    :cond_28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "heartbeat_success"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_29

    const/16 v0, 0xd1

    return v0

    .line 45
    :cond_29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "local_break_ice"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2a

    const/16 v0, 0xda

    return v0

    .line 46
    :cond_2a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "local_love_buzz_break_ice"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2b

    const/16 v0, 0xea

    return v0

    .line 47
    :cond_2b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v13, "chatroom_share"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0xad

    if-eqz v6, :cond_2f

    .line 48
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->lp()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_2c

    const/16 v0, 0xe0

    return v0

    :cond_2c
    const/16 v0, 0x59

    return v0

    .line 50
    :cond_2d
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2e

    return v13

    :cond_2e
    return v10

    .line 51
    :cond_2f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v14, "tantan_verify_toast"

    invoke-static {v6, v14}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_34

    if-lez v2, :cond_30

    add-int/lit8 v3, v2, -0x1

    .line 52
    invoke-virtual {v0, v3}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v3

    goto :goto_2

    :cond_30
    const/4 v3, 0x0

    .line 53
    :goto_2
    invoke-virtual {v0}, Ll/g900;->d()I

    move-result v4

    sub-int/2addr v4, v12

    if-ge v2, v4, :cond_31

    add-int/2addr v2, v12

    .line 54
    invoke-virtual {v0, v2}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v14

    goto :goto_3

    :cond_31
    const/4 v14, 0x0

    .line 55
    :goto_3
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-wide v2, v3, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpl-double v0, v2, v6

    if-nez v0, :cond_32

    goto :goto_4

    .line 56
    :cond_32
    invoke-static {v14}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    iget-wide v2, v14, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpl-double v0, v2, v6

    if-nez v0, :cond_33

    .line 57
    :goto_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v0

    .line 58
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    add-double/2addr v1, v3

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 59
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v1, v0, v5}, Lcom/p1/mobile/putong/core/api/g;->ah(Lcom/p1/mobile/putong/core/data/Message;Z)Lrx/c;

    :cond_33
    const/16 v0, 0xab

    return v0

    .line 61
    :cond_34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v15, "local_greeting_match_success"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_fb

    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v15, "local_chat_greeting_tip"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_35

    goto/16 :goto_28

    .line 63
    :cond_35
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v15, "red_packet_notification"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_36

    const/16 v0, 0xb8

    return v0

    .line 64
    :cond_36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v15, "local_friend_comment_toast"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_37

    const/16 v0, 0xb0

    return v0

    .line 65
    :cond_37
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v15, "local_real_shot_tips"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_38

    const/16 v0, 0xc1

    return v0

    .line 66
    :cond_38
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v15, "local_normal_tips"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const/16 v15, 0xc5

    if-eqz v6, :cond_39

    return v15

    .line 67
    :cond_39
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    move/from16 v16, v10

    const-string v10, "local_push_switch"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3a

    return v15

    .line 68
    :cond_3a
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "local_push_switch_plus"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3b

    return v15

    .line 69
    :cond_3b
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "common_double_title_icon_click"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3c

    const/16 v0, 0xf1

    return v0

    .line 70
    :cond_3c
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "moment_user_state"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const/16 v10, 0x61

    if-eqz v6, :cond_42

    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v6, :cond_3d

    .line 71
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_42

    .line 72
    :cond_3d
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->lq()Ljava/lang/String;

    move-result-object v0

    .line 74
    const-string v1, "normal_message"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3e

    return v5

    :cond_3e
    const/16 v0, 0x60

    return v0

    .line 75
    :cond_3f
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/StateData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/StateData;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v14, v2

    goto :goto_5

    :catch_0
    const/4 v14, 0x0

    .line 76
    :goto_5
    invoke-static {v14}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_40

    iget-object v2, v14, Lcom/p1/mobile/putong/core/data/StateData;->sourceFlag:Ljava/lang/String;

    const-string v3, "chatPartners"

    .line 77
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_40

    const/16 v0, 0x104

    return v0

    .line 78
    :cond_40
    invoke-virtual/range {p0 .. p1}, Ll/g900;->I(Lcom/p1/mobile/putong/core/data/Message;)Z

    move-result v0

    if-eqz v0, :cond_41

    const/16 v10, 0xf4

    :cond_41
    return v10

    .line 79
    :cond_42
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v15, "system_reminder"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_46

    .line 80
    iget-object v0, v0, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->W2()Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_43

    move v5, v12

    .line 81
    :cond_43
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    if-eqz v0, :cond_45

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    if-eqz v0, :cond_45

    .line 82
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/SystemReminder;->showOnce:Z

    if-eqz v0, :cond_44

    if-eqz v5, :cond_44

    return v10

    :cond_44
    const/16 v0, 0x6a

    return v0

    :cond_45
    return v10

    .line 83
    :cond_46
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "ai_picture"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_49

    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v6, :cond_47

    .line 84
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_49

    .line 85
    :cond_47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_48

    return v13

    :cond_48
    return v16

    .line 86
    :cond_49
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "icebreak_qa"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4c

    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v6, :cond_4a

    .line 87
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_4c

    .line 88
    :cond_4a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_4b

    return v13

    :cond_4b
    return v16

    .line 89
    :cond_4c
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "love_letter"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_4d

    return v13

    :cond_4d
    return v16

    .line 91
    :cond_4e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v10, "tickle"

    invoke-static {v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_fa

    .line 92
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v15, "local_tickle_tip"

    invoke-static {v6, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_fa

    .line 93
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const/16 v17, 0xaf

    const-string v12, "local_create_chat_group"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4f

    goto/16 :goto_27

    .line 94
    :cond_4f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "conversation_notification"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_f8

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const/16 v18, 0xb6

    const-string v12, "common_tip_list_show"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_f9

    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "common_tip"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_f9

    .line 97
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "local_ux_questionnaire_tip"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_f9

    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "local_heart_beat_lock_tip"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_50

    goto/16 :goto_26

    .line 99
    :cond_50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v6

    const-string v12, "oneweekcp_task"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    const-string v12, "unknown_"

    if-eqz v6, :cond_52

    .line 100
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v0

    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_51

    return v13

    :cond_51
    return v16

    .line 102
    :cond_52
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    move/from16 v19, v13

    const-string v13, "local_chanllenge_tips"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_53

    const/16 v0, 0xdc

    return v0

    .line 103
    :cond_53
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v13, "real_shot"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_56

    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v6, :cond_54

    .line 104
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_56

    .line 105
    :cond_54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_55

    const/16 v0, 0xbb

    return v0

    :cond_55
    const/16 v0, 0x41

    return v0

    .line 106
    :cond_56
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v13, "wooden_fish"

    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_58

    .line 107
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v0

    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_57

    return v19

    :cond_57
    return v16

    .line 109
    :cond_58
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "local_chat_assistant_question_new"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_59

    const/16 v0, 0xf8

    return v0

    .line 110
    :cond_59
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "two_sides_different_tip"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5a

    const/16 v0, 0xfb

    return v0

    .line 111
    :cond_5a
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "chat_assistant_question"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 112
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-nez v0, :cond_5b

    const/16 v0, 0x65

    return v0

    .line 113
    :cond_5b
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    const-string v2, "user"

    .line 114
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5c

    const/16 v0, 0xf6

    return v0

    .line 115
    :cond_5c
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5d

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    const-string v1, "system"

    .line 116
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5d

    const/16 v0, 0xf7

    return v0

    :cond_5d
    return v19

    .line 117
    :cond_5e
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v12, "local_intl_prompt_message_type"

    invoke-static {v6, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5f

    const/16 v0, 0x106

    return v0

    .line 118
    :cond_5f
    iget-object v6, v0, Ll/g900;->s:Ll/clz;

    invoke-virtual {v6}, Ll/clz;->e4()Z

    move-result v6

    const/16 v12, 0x99

    const/16 v13, 0x1b

    if-nez v6, :cond_66

    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v6

    invoke-virtual {v6}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v6

    invoke-interface {v6}, Ll/r97;->t()Z

    move-result v6

    if-nez v6, :cond_60

    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v6

    invoke-virtual {v6}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v6

    invoke-interface {v6}, Ll/r97;->B()Z

    move-result v6

    if-eqz v6, :cond_66

    :cond_60
    iget-object v6, v0, Ll/g900;->s:Ll/clz;

    iget-object v6, v6, Ll/clz;->r:Ll/vg60;

    iget-object v6, v6, Ll/vg60;->a:Ljava/util/List;

    .line 121
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lt v2, v6, :cond_66

    iget-object v6, v0, Ll/g900;->s:Ll/clz;

    .line 122
    invoke-virtual {v6}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v6

    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_66

    .line 123
    iget-object v6, v0, Ll/g900;->s:Ll/clz;

    invoke-virtual {v6}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v6

    iget-object v6, v6, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_64

    iget-object v6, v0, Ll/g900;->s:Ll/clz;

    iget-object v6, v6, Ll/clz;->p:Ljava/lang/String;

    .line 124
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_64

    .line 125
    iget-object v1, v0, Ll/g900;->s:Ll/clz;

    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-wide v3, v1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    iget-object v0, v0, Ll/g900;->s:Ll/clz;

    iget-wide v5, v0, Ll/clz;->q:J

    cmp-long v1, v3, v5

    if-lez v1, :cond_62

    .line 126
    iget-object v0, v0, Ll/clz;->r:Ll/vg60;

    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v2, v0, :cond_61

    return v13

    :cond_61
    return v12

    .line 127
    :cond_62
    iget-object v0, v0, Ll/clz;->r:Ll/vg60;

    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v2, v0, :cond_63

    return v12

    :cond_63
    return v13

    .line 128
    :cond_64
    iget-object v2, v0, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_65

    return v13

    .line 129
    :cond_65
    iget-object v2, v0, Ll/g900;->s:Ll/clz;

    iget-object v2, v2, Ll/clz;->p:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_66

    return v12

    .line 130
    :cond_66
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    if-eqz v2, :cond_67

    const/16 v0, 0x1e

    return v0

    .line 131
    :cond_67
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_68

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_68

    const/16 v0, 0x91

    return v0

    .line 132
    :cond_68
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    const-string v6, "profile_like"

    const-string v12, "state_comment"

    const-string v13, "state_like"

    if-eqz v2, :cond_6a

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_69

    goto :goto_6

    :cond_69
    move v2, v11

    goto/16 :goto_12

    .line 133
    :cond_6a
    :goto_6
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    const-string v14, "-1"

    invoke-static {v2, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    const/16 v20, 0x37

    if-eqz v2, :cond_6b

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v11, "text"

    .line 134
    invoke-static {v2, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6b

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 135
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6b

    return v20

    .line 136
    :cond_6b
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    const-string v11, ""

    if-eqz v2, :cond_6c

    const/16 v5, 0x15

    goto/16 :goto_c

    .line 137
    :cond_6c
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6d

    const/16 v5, 0x17

    goto/16 :goto_c

    .line 138
    :cond_6d
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6e

    const/16 v5, 0x14

    goto/16 :goto_c

    .line 139
    :cond_6e
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    const/16 v5, 0xc

    goto/16 :goto_c

    .line 140
    :cond_6f
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_76

    .line 141
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    move-result-object v2

    if-nez v2, :cond_70

    const/4 v4, 0x0

    goto :goto_7

    .line 142
    :cond_70
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    :goto_7
    if-nez v2, :cond_72

    .line 143
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 144
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    goto :goto_8

    :cond_71
    move-object v2, v11

    .line 145
    :goto_8
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v5, "MessagesAdapter unable to query question id : "

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " message id : "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 146
    :cond_72
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {v2, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_74

    if-eqz v4, :cond_73

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_74

    :cond_73
    return v20

    :cond_74
    if-nez v4, :cond_75

    const/4 v5, 0x0

    goto :goto_9

    .line 147
    :cond_75
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    :goto_9
    add-int/lit8 v5, v5, 0xd

    goto :goto_c

    .line 148
    :cond_76
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    if-eqz v2, :cond_77

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_78

    :cond_77
    const/4 v4, 0x0

    goto :goto_b

    .line 149
    :cond_78
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/p1/mobile/putong/data/Video;

    .line 150
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    if-eqz v2, :cond_79

    .line 151
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    :goto_a
    add-int/lit8 v5, v2, 0x1

    goto :goto_c

    .line 152
    :cond_79
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/p1/mobile/putong/data/Picture;

    .line 153
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    if-eqz v2, :cond_7a

    .line 154
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    goto :goto_a

    .line 155
    :cond_7a
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/p1/mobile/putong/data/Audio;

    if-eqz v2, :cond_7b

    const/16 v5, 0xb

    goto :goto_c

    :cond_7b
    :goto_b
    move v5, v4

    .line 156
    :goto_c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v2

    invoke-static {v2, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7c

    .line 157
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v2

    invoke-static {v2, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7e

    :cond_7c
    const/16 v2, 0x31

    if-eq v5, v2, :cond_7e

    const/16 v2, 0x30

    if-ne v5, v2, :cond_7d

    goto :goto_d

    :cond_7d
    return v17

    .line 158
    :cond_7e
    :goto_d
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "ai_picture_query_auth"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7f

    return v16

    .line 159
    :cond_7f
    invoke-static {v1}, Ll/zdq;->R(Lcom/p1/mobile/putong/core/data/Message;)Z

    move-result v2

    if-eqz v2, :cond_80

    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v2

    if-eqz v2, :cond_80

    return v16

    .line 161
    :cond_80
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v2

    const-string v4, "monetization_pending_payment_guidance"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v2

    if-eqz v2, :cond_81

    return v16

    .line 163
    :cond_81
    invoke-static {v1}, Ll/udq;->q(Lcom/p1/mobile/putong/core/data/Message;)Z

    move-result v2

    if-eqz v2, :cond_84

    .line 164
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v2

    if-eqz v2, :cond_83

    .line 165
    iget-object v2, v0, Ll/g900;->k:Ljava/util/Set;

    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_82

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    const-string v3, "enterVoiceRoomPackageGiftRecall"

    .line 166
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_82

    .line 167
    iget-object v0, v0, Ll/g900;->k:Ljava/util/Set;

    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v0, Ll/pf60;

    const-string v1, "audio_card_type"

    const-string v2, "message_audio_assistant"

    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Ll/pf60;

    const-string v2, "liveId"

    invoke-direct {v1, v2, v11}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Ll/pf60;

    const-string v3, "anchorId"

    invoke-direct {v2, v3, v11}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Ll/pf60;

    const-string v4, "topic_id"

    invoke-direct {v3, v4, v11}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v4, Ll/pf60;

    const-string v5, "audio_room_type"

    invoke-direct {v4, v5, v11}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, v1, v2, v3, v4}, [Ll/pf60;

    move-result-object v0

    const-string v1, "e_live_audio_room_enter"

    const-string v2, "p_chat_view"

    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    :cond_82
    const/16 v0, 0x40

    return v0

    :cond_83
    const/16 v0, 0xba

    return v0

    .line 169
    :cond_84
    invoke-static {v1}, Ll/udq;->p(Lcom/p1/mobile/putong/core/data/Message;)Z

    move-result v2

    if-eqz v2, :cond_86

    .line 170
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v2

    if-eqz v2, :cond_86

    .line 171
    iget-object v2, v0, Ll/g900;->o:Ljava/util/Set;

    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_85

    .line 172
    invoke-static {v1}, Ll/udq;->p(Lcom/p1/mobile/putong/core/data/Message;)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 173
    iget-object v0, v0, Ll/g900;->o:Ljava/util/Set;

    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 174
    const-string v0, "e_personalized_recommendation_helper"

    const-string v1, "p_messages_view"

    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    :cond_85
    const/16 v0, 0x58

    return v0

    .line 175
    :cond_86
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "literature"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_88

    .line 176
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_87

    const/16 v0, 0xc9

    return v0

    :cond_87
    const/16 v0, 0x47

    return v0

    .line 177
    :cond_88
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "feedback"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_89

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 178
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8d

    .line 179
    :cond_89
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8a

    .line 180
    :try_start_1
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v14, v2

    goto :goto_e

    :catch_1
    :cond_8a
    const/4 v14, 0x0

    .line 181
    :goto_e
    invoke-static {v14}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8d

    .line 182
    iget-object v2, v14, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->feedback_category:Ljava/lang/String;

    .line 183
    const-string v4, "solved"

    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8c

    const-string v4, "satisfied"

    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_8b

    goto :goto_f

    .line 184
    :cond_8b
    const-string v4, "reason"

    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8d

    .line 185
    iget-object v0, v14, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->question:Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackQuestion;->answers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x49

    return v0

    :cond_8c
    :goto_f
    const/16 v0, 0x48

    return v0

    .line 186
    :cond_8d
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8f

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 187
    invoke-static {v2, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8f

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 188
    invoke-static {v2, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8f

    .line 189
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_8e

    const/16 v0, 0xb5

    return v0

    :cond_8e
    const/16 v0, 0x3c

    return v0

    .line 190
    :cond_8f
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "hide_for_fake_user"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_92

    .line 191
    invoke-static {}, Ll/h39;->K()Z

    move-result v0

    if-nez v0, :cond_91

    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_90

    move/from16 v10, v19

    goto :goto_10

    :cond_90
    move/from16 v10, v16

    :goto_10
    return v10

    :cond_91
    const/16 v0, 0x66

    return v0

    :cond_92
    add-int/2addr v5, v3

    .line 193
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_93

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 194
    invoke-static {v2, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_95

    .line 195
    :cond_93
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_94

    const/16 v5, 0xc8

    goto :goto_11

    :cond_94
    const/16 v5, 0x45

    .line 196
    :cond_95
    :goto_11
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_98

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v2, :cond_96

    .line 197
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_98

    .line 198
    :cond_96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_97

    const/16 v2, 0xe1

    goto :goto_12

    :cond_97
    const/16 v2, 0x5a

    goto :goto_12

    .line 199
    :cond_98
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "exclusive_chat_invite"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9a

    .line 200
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_99

    const/16 v2, 0xe5

    goto :goto_12

    :cond_99
    const/16 v2, 0x5c

    goto :goto_12

    :cond_9a
    move v2, v5

    .line 201
    :goto_12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v4

    const-string v5, "profile_cover_like"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9c

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v4, :cond_9b

    .line 202
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_9c

    :cond_9b
    const/16 v2, 0x8c

    .line 203
    :cond_9c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v4

    const-string v5, "profile_cover_comment"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9e

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v4, :cond_9d

    .line 204
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_9e

    :cond_9d
    const/16 v2, 0x8c

    .line 205
    :cond_9e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v4

    const-string v5, "mood_like"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a0

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v4, :cond_9f

    .line 206
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_a0

    :cond_9f
    const/16 v2, 0x8c

    .line 207
    :cond_a0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v4

    const-string v5, "mood_comment"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a2

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v4, :cond_a1

    .line 208
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_a2

    :cond_a1
    const/16 v2, 0x8c

    .line 209
    :cond_a2
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v4, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a3

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 210
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a3

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 211
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_a3

    const/16 v2, 0x8c

    .line 212
    :cond_a3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v4

    const-string v5, "moment_comment"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a6

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v4, :cond_a4

    .line 213
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_a6

    .line 214
    :cond_a4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_a5

    const/16 v2, 0xc4

    goto :goto_13

    :cond_a5
    const/16 v2, 0x43

    :cond_a6
    :goto_13
    if-nez v3, :cond_a7

    .line 215
    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 216
    invoke-virtual {v4}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a7

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 217
    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a7

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 218
    invoke-virtual {v4}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v4

    iget-wide v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    iget-wide v7, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpl-double v4, v4, v7

    if-nez v4, :cond_a7

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 219
    invoke-virtual {v4}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    const-string v5, "female"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a7

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 220
    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    const-string v5, "male"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a7

    add-int/lit8 v12, v2, 0x1

    goto/16 :goto_18

    .line 221
    :cond_a7
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {v4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "letter"

    if-nez v4, :cond_b1

    if-nez v3, :cond_b1

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 222
    invoke-virtual {v4}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v4

    iget-wide v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    iget-wide v10, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpl-double v4, v7, v10

    if-nez v4, :cond_b1

    .line 223
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a8

    const/16 v12, 0x8f

    goto/16 :goto_18

    .line 224
    :cond_a8
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_aa

    :cond_a9
    :goto_14
    const/16 v12, 0x1b

    goto/16 :goto_18

    .line 225
    :cond_aa
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    const/16 v4, 0x90

    if-nez v2, :cond_af

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 226
    invoke-static {v2, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ab

    goto :goto_16

    .line 227
    :cond_ab
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    .line 228
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v2, :cond_ad

    .line 229
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ac

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_ac

    :goto_15
    move v12, v4

    goto/16 :goto_18

    :cond_ac
    const/16 v12, 0xe2

    goto/16 :goto_18

    .line 230
    :cond_ad
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ae

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_ae

    goto :goto_15

    :cond_ae
    const/16 v12, 0x8e

    goto/16 :goto_18

    .line 231
    :cond_af
    :goto_16
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b0

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_b0

    goto :goto_15

    :cond_b0
    const/16 v12, 0xca

    goto/16 :goto_18

    .line 232
    :cond_b1
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {v4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_ba

    if-nez v3, :cond_ba

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 233
    invoke-virtual {v4}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v4

    iget-wide v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    iget-wide v10, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpl-double v4, v7, v10

    if-nez v4, :cond_ba

    .line 234
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b2

    const/16 v12, 0x94

    goto/16 :goto_18

    .line 235
    :cond_b2
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b3

    goto/16 :goto_14

    .line 236
    :cond_b3
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    const/16 v4, 0x95

    if-nez v2, :cond_b8

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 237
    invoke-static {v2, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b4

    goto :goto_17

    .line 238
    :cond_b4
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    .line 239
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v2, :cond_b6

    .line 240
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b5

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_b5

    goto/16 :goto_15

    :cond_b5
    const/16 v12, 0xe3

    goto :goto_18

    .line 241
    :cond_b6
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b7

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_b7

    goto/16 :goto_15

    :cond_b7
    const/16 v12, 0x93

    goto :goto_18

    .line 242
    :cond_b8
    :goto_17
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b9

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_b9

    goto/16 :goto_15

    :cond_b9
    const/16 v12, 0xcb

    goto :goto_18

    .line 243
    :cond_ba
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v4

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_bb

    const/16 v4, 0x74

    if-ne v3, v4, :cond_a9

    const/16 v12, 0x99

    goto :goto_18

    :cond_bb
    move v12, v2

    .line 244
    :goto_18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v2

    const-string v4, "contact_info_rejection"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_bc

    const/16 v12, 0x9e

    .line 245
    :cond_bc
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v2

    const-string v4, "reminder"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_be

    .line 246
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_bd

    const/16 v12, 0xa0

    goto :goto_19

    :cond_bd
    const/16 v12, 0x22

    .line 247
    :cond_be
    :goto_19
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "moment_chat"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c1

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v2, :cond_bf

    .line 248
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_c1

    .line 249
    :cond_bf
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_c0

    const/16 v12, 0xa1

    goto :goto_1a

    :cond_c0
    const/16 v12, 0x23

    .line 250
    :cond_c1
    :goto_1a
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "survey"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c3

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v2, :cond_c2

    .line 251
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_c3

    :cond_c2
    const/16 v12, 0x29

    .line 252
    :cond_c3
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "card"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c6

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v2, :cond_c4

    .line 253
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_c6

    .line 254
    :cond_c4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_c5

    const/16 v12, 0xa5

    goto :goto_1b

    :cond_c5
    const/16 v12, 0x28

    .line 255
    :cond_c6
    :goto_1b
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_user_moment_message"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c7

    const/16 v12, 0xcd

    goto :goto_1c

    .line 256
    :cond_c7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v2

    const-string v4, "local_moment_post_guide"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c8

    const/16 v12, 0xe4

    .line 257
    :cond_c8
    :goto_1c
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "voice_call"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_cc

    .line 258
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ca

    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_c9

    const/16 v12, 0xa7

    goto :goto_1d

    :cond_c9
    const/16 v12, 0x2a

    goto :goto_1d

    .line 260
    :cond_ca
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_cb

    move/from16 v12, v19

    goto :goto_1d

    :cond_cb
    move/from16 v12, v16

    .line 261
    :cond_cc
    :goto_1d
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "call_2_buy"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_cd

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 262
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_cd

    const/16 v12, 0x32

    .line 263
    :cond_cd
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "ice_breaking"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_cf

    .line 264
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_ce

    const/16 v12, 0xb2

    goto :goto_1e

    :cond_ce
    const/16 v12, 0x3b

    .line 265
    :cond_cf
    :goto_1e
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "red_packet"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d1

    .line 266
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v2

    if-eqz v2, :cond_d0

    const/16 v12, 0xb7

    goto :goto_1f

    :cond_d0
    const/16 v12, 0x3d

    .line 267
    :cond_d1
    :goto_1f
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "new_survey"

    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d2

    const/16 v0, 0x3f

    return v0

    :cond_d2
    const/4 v2, 0x3

    const/16 v4, 0x74

    if-ne v3, v4, :cond_d5

    .line 268
    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 269
    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d3

    iget-object v4, v0, Ll/g900;->s:Ll/clz;

    .line 270
    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    move-result v4

    if-nez v4, :cond_d3

    iget v4, v1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    if-eq v4, v2, :cond_d4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_d3

    goto :goto_20

    :cond_d3
    const/16 v4, 0x74

    goto :goto_21

    :cond_d4
    :goto_20
    const/16 v0, 0xbd

    return v0

    :cond_d5
    :goto_21
    if-ne v3, v4, :cond_d6

    .line 271
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_d6

    const/16 v0, 0x109

    return v0

    .line 272
    :cond_d6
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_chat_inc_temp_warn"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d7

    const/16 v0, 0x44

    return v0

    .line 273
    :cond_d7
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "group_invitation"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d9

    .line 274
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d8

    const/16 v0, 0xce

    return v0

    :cond_d8
    const/16 v0, 0x54

    return v0

    .line 275
    :cond_d9
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "tag_guide"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_da

    const/16 v0, 0xdf

    return v0

    .line 276
    :cond_da
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_match_ice_break"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_db

    const/16 v0, 0xef

    return v0

    .line 277
    :cond_db
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_ai_p2p_chat_guide"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_dc

    const/16 v0, 0xfd

    return v0

    .line 278
    :cond_dc
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_pic_cert_guide"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_dd

    const/16 v0, 0x100

    return v0

    .line 279
    :cond_dd
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_intl_read_receipts_guide"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_de

    const/16 v0, 0x117

    return v0

    .line 280
    :cond_de
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_birthday_tip"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_df

    const/16 v0, 0xf2

    return v0

    .line 281
    :cond_df
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_ideal_enquiry"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e0

    const/16 v0, 0x10d

    return v0

    .line 282
    :cond_e0
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_love_letter_guide"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e1

    const/16 v0, 0x10e

    return v0

    .line 283
    :cond_e1
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "local_invitation_for_authentication"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e2

    const/16 v0, 0x110

    return v0

    .line 284
    :cond_e2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v3

    const-string v4, "tacit_test"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e3

    .line 285
    invoke-virtual {v0, v1, v12}, Ll/g900;->M(Lcom/p1/mobile/putong/core/data/Message;I)I

    move-result v0

    return v0

    .line 286
    :cond_e3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v3

    const-string v4, "picture_text_deeplink"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e4

    .line 287
    invoke-virtual {v0, v1, v12}, Ll/g900;->S(Lcom/p1/mobile/putong/core/data/Message;I)I

    move-result v0

    return v0

    .line 288
    :cond_e4
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v3, "local_add_tags_guide"

    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e6

    .line 289
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Ll/r97;->N4()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_e5

    const/16 v13, 0xeb

    goto :goto_22

    :cond_e5
    move/from16 v13, v19

    :goto_22
    return v13

    .line 290
    :cond_e6
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v3, "local_add_artwork_guide"

    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e8

    .line 291
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/p;->X:Ljava/util/List;

    .line 292
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_e7

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/p;->X:Ljava/util/List;

    .line 293
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt v0, v2, :cond_e7

    const/16 v13, 0xec

    goto :goto_23

    :cond_e7
    move/from16 v13, v19

    :goto_23
    return v13

    .line 294
    :cond_e8
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v2, "local_send_tags_text"

    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e9

    const/16 v0, 0xed

    return v0

    .line 295
    :cond_e9
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v2, "local_send_artwork_text"

    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ea

    const/16 v0, 0xee

    return v0

    .line 296
    :cond_ea
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v2, "harass_alert"

    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ec

    .line 297
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_eb

    return v18

    :cond_eb
    const/16 v0, 0x68

    return v0

    .line 298
    :cond_ec
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v2, "marriage_prologue"

    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ee

    .line 299
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_ed

    const/16 v0, 0x103

    return v0

    :cond_ed
    const/16 v0, 0x6c

    return v0

    :cond_ee
    const/16 v0, 0x8c

    if-eq v12, v0, :cond_f0

    .line 300
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->isUnknownType()Z

    move-result v0

    if-eqz v0, :cond_f0

    .line 301
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_ef

    return v19

    :cond_ef
    return v16

    .line 302
    :cond_f0
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v0, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f3

    .line 303
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f1

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f1

    const/16 v21, 0x8c

    return v21

    .line 304
    :cond_f1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_f2

    move/from16 v10, v19

    goto :goto_24

    :cond_f2
    move/from16 v10, v16

    :goto_24
    return v10

    .line 305
    :cond_f3
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v2, "limit_time_picture"

    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f6

    .line 306
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f4

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f4

    const/16 v21, 0x8c

    return v21

    .line 307
    :cond_f4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_f5

    move/from16 v10, v19

    goto :goto_25

    :cond_f5
    move/from16 v10, v16

    :goto_25
    return v10

    .line 308
    :cond_f6
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v1, "local_blindbox_guide"

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f7

    return v16

    :cond_f7
    return v12

    :cond_f8
    const/16 v18, 0xb6

    :cond_f9
    :goto_26
    return v18

    :cond_fa
    const/16 v17, 0xaf

    :goto_27
    return v17

    :cond_fb
    :goto_28
    const/16 v0, 0xbc

    return v0

    .line 309
    :goto_29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0, v1}, Ll/r97;->K2(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    move-result-object v0

    .line 310
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fc

    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->needOpen:Z

    if-eqz v0, :cond_fc

    move v5, v12

    goto :goto_2a

    :cond_fc
    move v5, v4

    .line 311
    :goto_2a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_fe

    if-eqz v5, :cond_fd

    const/16 v0, 0xbf

    return v0

    :cond_fd
    const/16 v0, 0xb9

    return v0

    :cond_fe
    if-eqz v5, :cond_ff

    const/16 v0, 0x42

    return v0

    :cond_ff
    const/16 v0, 0x3e

    return v0
.end method

.method public final S(Lcom/p1/mobile/putong/core/data/Message;I)I
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/16 p0, 0xad

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/16 p0, 0x35

    .line 21
    .line 22
    return p0
.end method

.method public T(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 6

    const/16 v0, 0x8c

    const/4 v1, 0x0

    if-ne p2, v0, :cond_0

    .line 1
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->B5:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_0
    const/16 v0, 0x9e

    if-ne p2, v0, :cond_1

    .line 2
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->d5:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1
    const/16 v0, 0x91

    if-ne p2, v0, :cond_2

    .line 3
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->F5:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2
    const/16 v0, 0xab

    const/4 v2, 0x1

    if-eq p2, v0, :cond_ac

    const/16 v3, 0xb0

    if-eq p2, v3, :cond_ac

    const/16 v3, 0xc1

    if-eq p2, v3, :cond_ac

    const/16 v3, 0xc5

    if-ne p2, v3, :cond_3

    goto/16 :goto_19

    :cond_3
    const/16 v0, 0xc0

    if-ne p2, v0, :cond_4

    .line 4
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->M3:I

    .line 7
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_4
    const/16 v0, 0xb8

    if-ne p2, v0, :cond_5

    .line 8
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->F3:I

    .line 11
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_5
    const/16 v0, 0xaf

    if-ne p2, v0, :cond_6

    .line 12
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->G2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_6
    const/16 v0, 0xbc

    if-ne p2, v0, :cond_7

    .line 13
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->b0:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_7
    const/16 v0, 0xb6

    if-eq p2, v0, :cond_ab

    const/16 v0, 0xfb

    if-ne p2, v0, :cond_8

    goto/16 :goto_18

    :cond_8
    const/16 v3, 0x3f

    if-ne p2, v3, :cond_9

    .line 14
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->l2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_9
    const/16 v3, 0xcd

    if-ne p2, v3, :cond_a

    .line 15
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->s3:I

    .line 18
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_a
    const/16 v3, 0xe4

    if-ne p2, v3, :cond_b

    .line 19
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->t3:I

    .line 22
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_b
    const/16 v3, 0xc2

    if-ne p2, v3, :cond_c

    .line 23
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->R2:I

    .line 26
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_c
    const/16 v3, 0xc3

    if-ne p2, v3, :cond_d

    .line 27
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->S2:I

    .line 30
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_d
    const/16 v3, 0xc6

    if-ne p2, v3, :cond_e

    .line 31
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->O1:I

    .line 34
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_e
    const/16 v3, 0xdb

    if-ne p2, v3, :cond_f

    .line 35
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->Q1:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_f
    const/16 v3, 0xf9

    if-eq p2, v3, :cond_aa

    const/16 v3, 0xfc

    if-ne p2, v3, :cond_10

    goto/16 :goto_17

    :cond_10
    const/16 v3, 0xfa

    if-ne p2, v3, :cond_11

    .line 36
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 37
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->J:I

    .line 39
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_11
    const/16 v3, 0xcf

    if-eq p2, v3, :cond_a9

    const/16 v3, 0xd0

    if-ne p2, v3, :cond_12

    goto/16 :goto_16

    :cond_12
    const/16 v3, 0xd1

    if-ne p2, v3, :cond_13

    .line 40
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->F1:I

    .line 43
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_13
    const/16 v3, 0xda

    if-ne p2, v3, :cond_14

    .line 44
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->Q2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_14
    const/16 v3, 0xd9

    if-ne p2, v3, :cond_15

    .line 45
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->K1:I

    .line 48
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_15
    const/16 v3, 0xd7

    if-ne p2, v3, :cond_16

    .line 49
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->x1:I

    .line 52
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_16
    const/16 v3, 0xf1

    if-ne p2, v3, :cond_17

    .line 53
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->q1:I

    .line 56
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_17
    const/16 v3, 0xdc

    if-ne p2, v3, :cond_18

    .line 57
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 58
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->l1:I

    .line 60
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_18
    const/16 v3, 0xdf

    if-ne p2, v3, :cond_19

    .line 61
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->H3:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_19
    const/16 v3, 0xef

    if-ne p2, v3, :cond_1a

    .line 62
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 63
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->a2:I

    .line 65
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1a
    const/16 v3, 0xfd

    if-ne p2, v3, :cond_1b

    .line 66
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 67
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->O2:I

    .line 69
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1b
    const/16 v3, 0x100

    if-ne p2, v3, :cond_1c

    .line 70
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 71
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->x3:I

    .line 73
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1c
    const/16 v3, 0x102

    if-ne p2, v3, :cond_1d

    .line 74
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 75
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->i3:I

    .line 77
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1d
    const/16 v3, 0x101

    if-ne p2, v3, :cond_1e

    .line 78
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 79
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->x2:I

    .line 81
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1e
    const/16 v3, 0x10b

    if-ne p2, v3, :cond_1f

    .line 82
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 83
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->o2:I

    .line 85
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1f
    const/16 v3, 0x10a

    if-ne p2, v3, :cond_20

    .line 86
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 87
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->J2:I

    .line 89
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_20
    const/16 v3, 0x10c

    if-ne p2, v3, :cond_21

    .line 90
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 91
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->g3:I

    .line 93
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_21
    const/16 v3, 0x6d

    if-ne p2, v3, :cond_22

    .line 94
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 95
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->P2:I

    .line 97
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_22
    const/16 v3, 0xea

    if-ne p2, v3, :cond_23

    .line 98
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 99
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->j3:I

    .line 101
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_23
    const/16 v3, 0xe7

    if-ne p2, v3, :cond_24

    .line 102
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 103
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->E4:I

    .line 105
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_24
    const/16 v3, 0xeb

    if-ne p2, v3, :cond_25

    .line 106
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 107
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->M2:I

    .line 109
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_25
    const/16 v3, 0xec

    if-ne p2, v3, :cond_26

    .line 110
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 111
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->L2:I

    .line 113
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_26
    const/16 v3, 0xed

    if-eq p2, v3, :cond_a8

    const/16 v3, 0xee

    if-ne p2, v3, :cond_27

    goto/16 :goto_15

    :cond_27
    const/16 v3, 0xf0

    if-ne p2, v3, :cond_28

    .line 114
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 115
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->c2:I

    .line 117
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_28
    const/16 v3, 0xf2

    if-ne p2, v3, :cond_29

    .line 118
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 119
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->Z1:I

    .line 121
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_29
    const/16 v3, 0xf3

    if-ne p2, v3, :cond_2a

    .line 122
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->C4:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2a
    const/16 v3, 0xf4

    if-ne p2, v3, :cond_2b

    .line 123
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 124
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->S1:I

    .line 126
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2b
    const/16 v3, 0xf8

    if-ne p2, v3, :cond_2c

    .line 127
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 128
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->m1:I

    .line 130
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2c
    const/16 v3, 0xf7

    if-ne p2, v3, :cond_2d

    .line 131
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 132
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->n1:I

    .line 134
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2d
    if-ne p2, v0, :cond_2e

    .line 135
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 136
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->u:I

    .line 138
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2e
    const/16 v0, 0x68

    if-ne p2, v0, :cond_2f

    .line 139
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 140
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->U3:I

    .line 142
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_2f
    const/16 v0, 0x6a

    if-ne p2, v0, :cond_30

    .line 143
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->V3:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_30
    const/16 v0, 0x61

    if-ne p2, v0, :cond_31

    .line 144
    new-instance p1, Landroid/view/View;

    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object p1

    :cond_31
    const/16 v0, 0x105

    if-ne p2, v0, :cond_32

    .line 145
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 146
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->H2:I

    .line 148
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_32
    const/16 v0, 0x106

    if-ne p2, v0, :cond_33

    .line 149
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 150
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->t:I

    .line 152
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_33
    const/16 v0, 0x117

    if-ne p2, v0, :cond_34

    .line 153
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 154
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->I1:I

    .line 156
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_34
    const/16 v0, 0x108

    if-ne p2, v0, :cond_35

    .line 157
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->p:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_35
    const/16 v0, 0x112

    if-ne p2, v0, :cond_36

    .line 158
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->q:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_36
    const/16 v0, 0x114

    if-ne p2, v0, :cond_37

    .line 159
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->e2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_37
    const/16 v0, 0x113

    if-ne p2, v0, :cond_38

    .line 160
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 161
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->d1:I

    .line 163
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_38
    const/16 v0, 0x116

    if-ne p2, v0, :cond_39

    .line 164
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 165
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->N2:I

    .line 167
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_39
    const/16 v0, 0x10d

    if-ne p2, v0, :cond_3a

    .line 168
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 169
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->T1:I

    .line 171
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_3a
    const/16 v0, 0x10e

    if-ne p2, v0, :cond_3b

    .line 172
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 173
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->V1:I

    .line 175
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_3b
    const/16 v0, 0x110

    if-ne p2, v0, :cond_3c

    .line 176
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 177
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->b3:I

    .line 179
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_3c
    const/16 v0, 0x74

    if-lt p2, v0, :cond_3d

    move v3, v2

    goto :goto_0

    :cond_3d
    move v3, v1

    .line 180
    :goto_0
    iget-object v4, p0, Ll/g900;->s:Ll/clz;

    .line 181
    invoke-virtual {v4}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v4

    .line 182
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object v4

    if-eqz v3, :cond_3e

    .line 183
    sget v5, Ll/qec0;->i5:I

    goto :goto_1

    :cond_3e
    sget v5, Ll/qec0;->h5:I

    .line 184
    :goto_1
    invoke-virtual {v4, v5, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 185
    sget v4, Ll/qec0;->L5:I

    const/16 v5, 0x17

    if-ne p2, v5, :cond_3f

    .line 186
    sget v4, Ll/qec0;->q5:I

    goto/16 :goto_14

    :cond_3f
    const/16 v5, 0x8b

    if-ne p2, v5, :cond_40

    .line 187
    sget v4, Ll/qec0;->r5:I

    goto/16 :goto_14

    :cond_40
    const/16 v5, 0x15

    if-ne p2, v5, :cond_41

    .line 188
    sget v4, Ll/qec0;->b5:I

    goto/16 :goto_14

    :cond_41
    const/16 v5, 0x89

    if-ne p2, v5, :cond_42

    .line 189
    sget v4, Ll/qec0;->c5:I

    goto/16 :goto_14

    :cond_42
    const/16 v5, 0x23

    if-ne p2, v5, :cond_43

    .line 190
    sget v4, Ll/qec0;->u5:I

    goto/16 :goto_14

    :cond_43
    const/16 v5, 0xa1

    if-ne p2, v5, :cond_44

    .line 191
    sget v4, Ll/qec0;->v5:I

    goto/16 :goto_14

    :cond_44
    if-eqz p2, :cond_a6

    const/16 v5, 0x38

    if-ne p2, v5, :cond_45

    goto/16 :goto_13

    :cond_45
    const/16 v5, 0x30

    if-ne p2, v5, :cond_46

    .line 192
    sget v4, Ll/qec0;->G4:I

    goto/16 :goto_14

    :cond_46
    const/16 v5, 0x29

    if-ne p2, v5, :cond_47

    .line 193
    sget v4, Ll/qec0;->K5:I

    goto/16 :goto_14

    :cond_47
    if-ne p2, v0, :cond_48

    .line 194
    sget v4, Ll/qec0;->J5:I

    goto/16 :goto_14

    :cond_48
    const/16 v0, 0x31

    if-ne p2, v0, :cond_49

    .line 195
    sget v4, Ll/qec0;->F4:I

    goto/16 :goto_14

    :cond_49
    const/4 v0, 0x2

    if-lt p2, v0, :cond_4a

    const/16 v5, 0xa

    if-gt p2, v5, :cond_4a

    .line 196
    sget v4, Ll/qec0;->f5:I

    add-int/lit8 v1, p2, -0x2

    goto/16 :goto_14

    :cond_4a
    const/16 v0, 0x76

    if-lt p2, v0, :cond_4b

    const/16 v5, 0x7e

    if-gt p2, v5, :cond_4b

    .line 197
    sget v4, Ll/qec0;->g5:I

    add-int/lit8 v1, p2, -0x76

    goto/16 :goto_14

    :cond_4b
    const/16 v0, 0xb

    if-ne p2, v0, :cond_4c

    .line 198
    sget v4, Ll/qec0;->U4:I

    goto/16 :goto_14

    :cond_4c
    const/16 v0, 0x7f

    if-ne p2, v0, :cond_4d

    .line 199
    sget v4, Ll/qec0;->V4:I

    goto/16 :goto_14

    :cond_4d
    const/16 v0, 0xc

    if-eq p2, v0, :cond_a5

    const/16 v0, 0x80

    if-ne p2, v0, :cond_4e

    goto/16 :goto_12

    :cond_4e
    const/16 v0, 0xd

    if-lt p2, v0, :cond_4f

    const/16 v5, 0x13

    if-gt p2, v5, :cond_4f

    .line 200
    sget v4, Ll/qec0;->z5:I

    add-int/lit8 v1, p2, -0xd

    goto/16 :goto_14

    :cond_4f
    const/16 v0, 0x81

    if-lt p2, v0, :cond_50

    const/16 v5, 0x87

    if-gt p2, v5, :cond_50

    .line 201
    sget v4, Ll/qec0;->A5:I

    add-int/lit16 v1, p2, -0x81

    goto/16 :goto_14

    :cond_50
    const/16 v0, 0x14

    if-ne p2, v0, :cond_51

    .line 202
    sget v4, Ll/qec0;->s5:I

    goto/16 :goto_14

    :cond_51
    const/16 v0, 0x88

    if-ne p2, v0, :cond_52

    .line 203
    sget v4, Ll/qec0;->t5:I

    goto/16 :goto_14

    :cond_52
    const/16 v0, 0x1b

    if-ne p2, v0, :cond_53

    .line 204
    sget v4, Ll/qec0;->R5:I

    goto/16 :goto_14

    :cond_53
    const/16 v0, 0x99

    if-ne p2, v0, :cond_54

    .line 205
    sget v4, Ll/qec0;->S5:I

    goto/16 :goto_14

    :cond_54
    const/16 v0, 0x1e

    if-ne p2, v0, :cond_55

    .line 206
    sget v4, Ll/qec0;->f5:I

    move v1, v2

    goto/16 :goto_14

    :cond_55
    const/16 v0, 0x22

    if-ne p2, v0, :cond_56

    .line 207
    sget v4, Ll/qec0;->D5:I

    goto/16 :goto_14

    :cond_56
    const/16 v0, 0xa0

    if-ne p2, v0, :cond_57

    .line 208
    sget v4, Ll/qec0;->E5:I

    goto/16 :goto_14

    :cond_57
    const/16 v0, 0x28

    if-ne p2, v0, :cond_58

    .line 209
    sget v4, Ll/qec0;->Z4:I

    goto/16 :goto_14

    :cond_58
    const/16 v0, 0xa5

    if-ne p2, v0, :cond_59

    .line 210
    sget v4, Ll/qec0;->a5:I

    goto/16 :goto_14

    :cond_59
    const/16 v0, 0x2a

    if-ne p2, v0, :cond_5a

    .line 211
    sget v4, Ll/qec0;->N3:I

    goto/16 :goto_14

    :cond_5a
    const/16 v0, 0xa7

    if-ne p2, v0, :cond_5b

    .line 212
    sget v4, Ll/qec0;->O3:I

    goto/16 :goto_14

    :cond_5b
    const/16 v0, 0x32

    if-ne p2, v0, :cond_5c

    .line 213
    sget v4, Ll/qec0;->d:I

    goto/16 :goto_14

    :cond_5c
    const/16 v0, 0x33

    if-ne p2, v0, :cond_5d

    .line 214
    sget v4, Ll/qec0;->H4:I

    goto/16 :goto_14

    :cond_5d
    const/16 v0, 0x35

    if-ne p2, v0, :cond_5e

    .line 215
    sget v4, Ll/qec0;->M5:I

    goto/16 :goto_14

    :cond_5e
    const/16 v0, 0xad

    if-ne p2, v0, :cond_5f

    .line 216
    sget v4, Ll/qec0;->N5:I

    goto/16 :goto_14

    :cond_5f
    const/16 v0, 0x37

    if-ne p2, v0, :cond_60

    .line 217
    sget v4, Ll/qec0;->H5:I

    goto/16 :goto_14

    :cond_60
    const/16 v0, 0x3b

    if-ne p2, v0, :cond_61

    .line 218
    sget v4, Ll/qec0;->L4:I

    goto/16 :goto_14

    :cond_61
    const/16 v0, 0xb2

    if-ne p2, v0, :cond_62

    .line 219
    sget v4, Ll/qec0;->M4:I

    goto/16 :goto_14

    :cond_62
    const/16 v0, 0x3c

    if-ne p2, v0, :cond_63

    .line 220
    sget v4, Ll/qec0;->B2:I

    goto/16 :goto_14

    :cond_63
    const/16 v0, 0xb5

    if-ne p2, v0, :cond_64

    .line 221
    sget v4, Ll/qec0;->C2:I

    goto/16 :goto_14

    :cond_64
    const/16 v0, 0xb7

    if-eq p2, v0, :cond_a4

    const/16 v0, 0x3d

    if-ne p2, v0, :cond_65

    goto/16 :goto_11

    :cond_65
    const/16 v0, 0x3e

    if-ne p2, v0, :cond_66

    .line 222
    sget v4, Ll/qec0;->y1:I

    goto/16 :goto_14

    :cond_66
    const/16 v0, 0xb9

    if-ne p2, v0, :cond_67

    .line 223
    sget v4, Ll/qec0;->z1:I

    goto/16 :goto_14

    :cond_67
    const/16 v0, 0xba

    if-ne p2, v0, :cond_68

    .line 224
    sget v4, Ll/qec0;->v2:I

    goto/16 :goto_14

    :cond_68
    const/16 v0, 0x40

    if-eq p2, v0, :cond_a3

    const/16 v0, 0x58

    if-ne p2, v0, :cond_69

    goto/16 :goto_10

    :cond_69
    const/16 v0, 0x64

    if-eq p2, v0, :cond_a2

    const/16 v0, 0xf5

    if-ne p2, v0, :cond_6a

    goto/16 :goto_f

    :cond_6a
    const/16 v0, 0x41

    if-ne p2, v0, :cond_6b

    .line 225
    sget v4, Ll/qec0;->A3:I

    goto/16 :goto_14

    :cond_6b
    const/16 v0, 0xbb

    if-ne p2, v0, :cond_6c

    .line 226
    sget v4, Ll/qec0;->B3:I

    goto/16 :goto_14

    :cond_6c
    const/16 v0, 0x42

    if-ne p2, v0, :cond_6d

    .line 227
    sget v4, Ll/qec0;->A1:I

    goto/16 :goto_14

    :cond_6d
    const/16 v0, 0xbf

    if-ne p2, v0, :cond_6e

    .line 228
    sget v4, Ll/qec0;->B1:I

    goto/16 :goto_14

    :cond_6e
    const/16 v0, 0x43

    if-ne p2, v0, :cond_6f

    .line 229
    sget v4, Ll/qec0;->p3:I

    goto/16 :goto_14

    :cond_6f
    const/16 v0, 0xc4

    if-ne p2, v0, :cond_70

    .line 230
    sget v4, Ll/qec0;->q3:I

    goto/16 :goto_14

    :cond_70
    const/16 v0, 0x45

    if-ne p2, v0, :cond_71

    .line 231
    sget v4, Ll/qec0;->W2:I

    goto/16 :goto_14

    :cond_71
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_72

    .line 232
    sget v4, Ll/qec0;->X2:I

    goto/16 :goto_14

    :cond_72
    const/16 v0, 0x47

    if-ne p2, v0, :cond_73

    .line 233
    sget v4, Ll/qec0;->C3:I

    goto/16 :goto_14

    :cond_73
    const/16 v0, 0xc9

    if-ne p2, v0, :cond_74

    .line 234
    sget v4, Ll/qec0;->D3:I

    goto/16 :goto_14

    :cond_74
    const/16 v0, 0x48

    if-ne p2, v0, :cond_75

    .line 235
    sget v4, Ll/qec0;->Y2:I

    goto/16 :goto_14

    :cond_75
    const/16 v0, 0x49

    if-lt p2, v0, :cond_76

    const/16 v2, 0x53

    if-gt p2, v2, :cond_76

    .line 236
    sget v4, Ll/qec0;->a3:I

    add-int/lit8 v1, p2, -0x49

    goto/16 :goto_14

    :cond_76
    const/16 v0, 0xce

    if-eq p2, v0, :cond_a1

    const/16 v0, 0x54

    if-ne p2, v0, :cond_77

    goto/16 :goto_e

    :cond_77
    const/16 v0, 0x55

    if-eq p2, v0, :cond_a0

    const/16 v0, 0xd2

    if-ne p2, v0, :cond_78

    goto/16 :goto_d

    :cond_78
    const/16 v0, 0x56

    if-eq p2, v0, :cond_9f

    const/16 v0, 0xd8

    if-ne p2, v0, :cond_79

    goto/16 :goto_c

    :cond_79
    const/16 v0, 0x57

    if-eq p2, v0, :cond_9e

    const/16 v0, 0xcc

    if-ne p2, v0, :cond_7a

    goto/16 :goto_b

    :cond_7a
    const/16 v0, 0x59

    if-eq p2, v0, :cond_9d

    const/16 v0, 0xe0

    if-ne p2, v0, :cond_7b

    goto/16 :goto_a

    :cond_7b
    const/16 v0, 0x5a

    if-ne p2, v0, :cond_7c

    .line 237
    sget v4, Ll/qec0;->y3:I

    goto/16 :goto_14

    :cond_7c
    const/16 v0, 0xe1

    if-ne p2, v0, :cond_7d

    .line 238
    sget v4, Ll/qec0;->z3:I

    goto/16 :goto_14

    :cond_7d
    const/16 v0, 0x5c

    if-eq p2, v0, :cond_9c

    const/16 v0, 0xe5

    if-ne p2, v0, :cond_7e

    goto/16 :goto_9

    :cond_7e
    const/16 v0, 0x5e

    if-eq p2, v0, :cond_9b

    const/16 v0, 0xe8

    if-ne p2, v0, :cond_7f

    goto/16 :goto_8

    :cond_7f
    const/16 v0, 0x5f

    if-ne p2, v0, :cond_80

    .line 239
    sget v4, Ll/qec0;->U2:I

    goto/16 :goto_14

    :cond_80
    const/16 v0, 0xe9

    if-ne p2, v0, :cond_81

    .line 240
    sget v4, Ll/qec0;->V2:I

    goto/16 :goto_14

    :cond_81
    const/16 v0, 0x60

    if-eq p2, v0, :cond_9a

    const/16 v0, 0x104

    if-ne p2, v0, :cond_82

    goto/16 :goto_7

    :cond_82
    const/16 v0, 0x62

    if-ne p2, v0, :cond_83

    .line 241
    sget v4, Ll/qec0;->i2:I

    goto/16 :goto_14

    :cond_83
    const/16 v0, 0x63

    if-ne p2, v0, :cond_84

    .line 242
    sget v4, Ll/qec0;->w2:I

    goto/16 :goto_14

    :cond_84
    const/16 v0, 0x65

    if-ne p2, v0, :cond_85

    .line 243
    sget v4, Ll/qec0;->K5:I

    goto/16 :goto_14

    :cond_85
    const/16 v0, 0xf6

    if-ne p2, v0, :cond_86

    goto/16 :goto_14

    :cond_86
    const/16 v0, 0x66

    if-ne p2, v0, :cond_87

    .line 244
    sget v4, Ll/qec0;->S3:I

    goto/16 :goto_14

    :cond_87
    const/16 v0, 0x67

    if-ne p2, v0, :cond_88

    .line 245
    sget v4, Ll/qec0;->M1:I

    goto/16 :goto_14

    :cond_88
    const/16 v0, 0xfe

    if-ne p2, v0, :cond_89

    .line 246
    sget v4, Ll/qec0;->N1:I

    goto/16 :goto_14

    :cond_89
    const/16 v0, 0x69

    if-ne p2, v0, :cond_8a

    .line 247
    sget v4, Ll/qec0;->L1:I

    goto/16 :goto_14

    :cond_8a
    const/16 v0, 0x6b

    if-eq p2, v0, :cond_99

    const/16 v0, 0xff

    if-ne p2, v0, :cond_8b

    goto/16 :goto_6

    :cond_8b
    const/16 v0, 0x103

    if-eq p2, v0, :cond_98

    const/16 v0, 0x6c

    if-ne p2, v0, :cond_8c

    goto :goto_5

    :cond_8c
    const/16 v0, 0x39

    if-ne p2, v0, :cond_8d

    .line 248
    sget v4, Ll/qec0;->g4:I

    goto/16 :goto_14

    :cond_8d
    const/16 v0, 0x6e

    if-eq p2, v0, :cond_97

    const/16 v0, 0x107

    if-ne p2, v0, :cond_8e

    goto :goto_4

    :cond_8e
    const/16 v0, 0x6f

    if-eq p2, v0, :cond_96

    const/16 v0, 0x10f

    if-ne p2, v0, :cond_8f

    goto :goto_3

    :cond_8f
    const/16 v0, 0x70

    if-eq p2, v0, :cond_95

    const/16 v0, 0x111

    if-ne p2, v0, :cond_90

    goto :goto_2

    :cond_90
    const/16 v0, 0x71

    if-ne p2, v0, :cond_91

    .line 249
    sget v4, Ll/qec0;->s2:I

    goto/16 :goto_14

    :cond_91
    const/16 v0, 0x72

    if-ne p2, v0, :cond_92

    .line 250
    sget v4, Ll/qec0;->J3:I

    goto :goto_14

    :cond_92
    const/16 v0, 0x115

    if-ne p2, v0, :cond_93

    .line 251
    sget v4, Ll/qec0;->K3:I

    goto :goto_14

    :cond_93
    const/16 v0, 0x73

    if-ne p2, v0, :cond_94

    .line 252
    sget v4, Ll/qec0;->Y0:I

    goto :goto_14

    :cond_94
    const/16 v0, 0x119

    if-ne p2, v0, :cond_a7

    .line 253
    sget v4, Ll/qec0;->Z0:I

    goto :goto_14

    .line 254
    :cond_95
    :goto_2
    sget v4, Ll/qec0;->O4:I

    goto :goto_14

    .line 255
    :cond_96
    :goto_3
    sget v4, Ll/qec0;->b2:I

    goto :goto_14

    .line 256
    :cond_97
    :goto_4
    sget v4, Ll/qec0;->J1:I

    goto :goto_14

    .line 257
    :cond_98
    :goto_5
    sget v4, Ll/qec0;->d2:I

    goto :goto_14

    .line 258
    :cond_99
    :goto_6
    sget v4, Ll/qec0;->Y1:I

    goto :goto_14

    .line 259
    :cond_9a
    :goto_7
    sget v4, Ll/qec0;->R1:I

    goto :goto_14

    .line 260
    :cond_9b
    :goto_8
    sget v4, Ll/qec0;->D4:I

    goto :goto_14

    .line 261
    :cond_9c
    :goto_9
    sget v4, Ll/qec0;->Q3:I

    goto :goto_14

    .line 262
    :cond_9d
    :goto_a
    sget v4, Ll/qec0;->U1:I

    goto :goto_14

    .line 263
    :cond_9e
    :goto_b
    sget v4, Ll/qec0;->P1:I

    goto :goto_14

    .line 264
    :cond_9f
    :goto_c
    sget v4, Ll/qec0;->F2:I

    goto :goto_14

    .line 265
    :cond_a0
    :goto_d
    sget v4, Ll/qec0;->L3:I

    goto :goto_14

    .line 266
    :cond_a1
    :goto_e
    sget v4, Ll/qec0;->m0:I

    goto :goto_14

    .line 267
    :cond_a2
    :goto_f
    sget v4, Ll/qec0;->E2:I

    goto :goto_14

    .line 268
    :cond_a3
    :goto_10
    sget v4, Ll/qec0;->u2:I

    goto :goto_14

    .line 269
    :cond_a4
    :goto_11
    sget v4, Ll/qec0;->E3:I

    goto :goto_14

    .line 270
    :cond_a5
    :goto_12
    sget v4, Ll/qec0;->G5:I

    goto :goto_14

    .line 271
    :cond_a6
    :goto_13
    sget v4, Ll/qec0;->I5:I

    .line 272
    :cond_a7
    :goto_14
    iget-object p0, p0, Ll/l900;->a:Landroid/view/ViewGroup;

    invoke-virtual {p1, v4, p0, v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->U(ILandroid/view/View;IZ)V

    return-object p1

    .line 273
    :cond_a8
    :goto_15
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->G3:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    .line 274
    :cond_a9
    :goto_16
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 275
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 276
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->E1:I

    .line 277
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    .line 278
    :cond_aa
    :goto_17
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->n:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    .line 279
    :cond_ab
    :goto_18
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 280
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 281
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->u:I

    .line 282
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_ac
    :goto_19
    if-ne p2, v0, :cond_ad

    .line 283
    iget-boolean p2, p0, Ll/g900;->p:Z

    if-nez p2, :cond_ad

    .line 284
    const-string p2, "e_toast_chat_page_verification_guide"

    const-string v0, "p_chat_view"

    invoke-static {p2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    iput-boolean v2, p0, Ll/g900;->p:Z

    .line 286
    :cond_ad
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 287
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    .line 288
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Ll/qec0;->I3:I

    .line 289
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public V(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "fake_id_"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/r97;->q1()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public W(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/g900;->K(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "toShare"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/g900;->K(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "shared"

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public X(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ll/g900;->N(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->androidValue:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Ll/g900;->b0(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "normal"

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V
    .locals 19

    move-object/from16 v2, p0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v3, p3

    move/from16 v6, p4

    .line 1
    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v4}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v4

    if-nez v4, :cond_0

    goto/16 :goto_15

    .line 2
    :cond_0
    div-int/lit16 v4, v3, 0x3e8

    const/16 v5, 0x9

    if-ne v4, v5, :cond_1

    add-int/lit16 v3, v3, -0x2328

    .line 3
    :cond_1
    div-int/lit16 v4, v3, 0x3e8

    const/4 v5, 0x7

    if-ne v4, v5, :cond_2

    add-int/lit16 v3, v3, -0x1b58

    .line 4
    :cond_2
    div-int/lit16 v4, v3, 0x3e8

    const/16 v5, 0x8

    if-ne v4, v5, :cond_3

    add-int/lit16 v3, v3, -0x1f40

    .line 5
    :cond_3
    div-int/lit16 v4, v3, 0x3e8

    const/4 v5, 0x5

    if-ne v4, v5, :cond_4

    add-int/lit16 v3, v3, -0x1388

    .line 6
    :cond_4
    div-int/lit16 v4, v3, 0x3e8

    const/4 v7, 0x2

    if-ne v4, v7, :cond_5

    add-int/lit16 v3, v3, -0x7d0

    .line 7
    :cond_5
    div-int/lit16 v4, v3, 0x3e8

    const/16 v5, 0xa

    if-ne v4, v5, :cond_6

    add-int/lit16 v3, v3, -0x2710

    .line 8
    :cond_6
    div-int/lit16 v4, v3, 0x3e8

    const/16 v5, 0xb

    if-ne v4, v5, :cond_7

    add-int/lit16 v3, v3, -0x2af8

    .line 9
    :cond_7
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    const-string v5, "group"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    const/4 v8, 0x1

    if-nez v4, :cond_9

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v4

    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v4

    invoke-interface {v4}, Ll/r97;->c()Z

    move-result v4

    if-nez v4, :cond_8

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v4

    invoke-virtual {v4}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    move-result v4

    if-eqz v4, :cond_9

    :cond_8
    div-int/lit16 v4, v3, 0x3e8

    if-ne v4, v8, :cond_9

    add-int/lit16 v3, v3, -0x3e8

    :cond_9
    move v9, v3

    .line 12
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatUnlockLayout;

    const/4 v10, 0x0

    if-eqz v3, :cond_a

    .line 13
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/ItemChatUnlockLayout;

    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatUnlockLayout;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 15
    :cond_a
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockLayout;

    if-eqz v3, :cond_b

    .line 16
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockLayout;

    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockLayout;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 17
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 18
    :cond_b
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

    if-eqz v3, :cond_c

    const/16 v3, 0xf9

    if-eq v9, v3, :cond_c

    const/16 v3, 0xfc

    if-eq v9, v3, :cond_c

    .line 19
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

    iget-object v4, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v3, v9, v1, v4}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d(ILcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    .line 20
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 21
    :cond_c
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;

    if-eqz v3, :cond_d

    .line 22
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;

    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->i(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 23
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 24
    :cond_d
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;

    if-eqz v3, :cond_e

    .line 25
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;

    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    .line 26
    invoke-virtual {v4}, Ll/clz;->t7()Ll/qzz;

    move-result-object v4

    iget-object v5, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    iget-object v11, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v11}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    move-result-object v11

    iget-object v12, v2, Ll/g900;->s:Ll/clz;

    iget-object v12, v12, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {v3, v4, v5, v11, v12}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->g(Ll/qzz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 27
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 28
    :cond_e
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;

    if-eqz v3, :cond_f

    .line 29
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;

    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->f(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 30
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 31
    :cond_f
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;

    if-eqz v3, :cond_10

    .line 32
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;

    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    iget-object v5, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v5

    invoke-virtual {v3, v4, v1, v5}, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 33
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 34
    :cond_10
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;

    if-eqz v3, :cond_11

    .line 35
    move-object v3, v0

    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;

    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    .line 36
    invoke-virtual {v4}, Ll/clz;->t7()Ll/qzz;

    move-result-object v4

    iget-object v5, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    iget-object v11, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v11}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    move-result-object v11

    invoke-virtual {v3, v4, v5, v11}, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->g(Ll/qzz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 37
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 38
    :cond_11
    instance-of v3, v0, Lcom/p1/mobile/putong/core/ui/messages/HistoryContentItem;

    if-eqz v3, :cond_12

    .line 39
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    :cond_12
    move-object v11, v0

    .line 40
    nop

    instance-of v0, v11, Lcom/p1/mobile/putong/core/ui/messages/ItemFriendActiveRemindFemale;

    if-eqz v0, :cond_13

    .line 41
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemFriendActiveRemindFemale;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFriendActiveRemindFemale;->b(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void

    .line 42
    :cond_13
    instance-of v0, v11, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;

    if-eqz v0, :cond_14

    .line 43
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    invoke-virtual {v11, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->T(Lcom/p1/mobile/android/app/Act;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 44
    :cond_14
    instance-of v0, v11, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceTip;

    if-eqz v0, :cond_15

    .line 45
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceTip;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceTip;->b(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void

    .line 46
    :cond_15
    const-string v0, ", convertView:"

    const-string v3, ", ab:"

    const-string v4, "itemViewType:"

    const-string v12, "p_chat_view"

    const/4 v13, 0x3

    sparse-switch v9, :sswitch_data_0

    goto/16 :goto_2

    .line 47
    :sswitch_0
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v2, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->X(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    .line 48
    :sswitch_1
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->s(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 49
    :sswitch_2
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-virtual {v11, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->S(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 50
    :sswitch_3
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->n(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 51
    :sswitch_4
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBoxV2;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    invoke-virtual {v11, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBoxV2;->S(Lcom/p1/mobile/android/app/Act;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 52
    :sswitch_5
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v3, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/g900;Ll/n100;)V

    return-void

    .line 53
    :sswitch_6
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v2, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->f(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    .line 54
    :sswitch_7
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v2, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->p(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    .line 55
    :sswitch_8
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    .line 56
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iget-object v3, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v2, v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;->e(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    .line 57
    :sswitch_9
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemODiamondVisitorGuideMessage;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    .line 58
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    invoke-virtual {v11, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemODiamondVisitorGuideMessage;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void

    .line 59
    :sswitch_a
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;

    iget-object v0, v2, Ll/g900;->s:Ll/clz;

    .line 60
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v1, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-object v3, v2, Ll/g900;->s:Ll/clz;

    iget-object v3, v3, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {v11, v0, v2, v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemWechatNotifyGuideMessage;->c(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void

    .line 61
    :sswitch_b
    move-object v0, v11

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 62
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 63
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;

    iget-object v4, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v0, v2, v1, v4}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->g(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    move-object v15, v2

    :cond_16
    :goto_0
    move v14, v9

    move/from16 v17, v13

    move-object v13, v3

    goto/16 :goto_e

    .line 64
    :sswitch_c
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlConversationPrompt;

    iget-object v0, v2, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlConversationPrompt;->s(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    .line 65
    :sswitch_d
    move-object v0, v11

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

    iget-object v3, v2, Ll/g900;->s:Ll/clz;

    .line 66
    invoke-virtual {v3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v3

    iget-object v4, v2, Ll/g900;->s:Ll/clz;

    invoke-virtual {v4}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    iget-object v5, v2, Ll/g900;->s:Ll/clz;

    iget-object v5, v5, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    move-object/from16 v18, v5

    move-object v5, v1

    move-object v1, v3

    move-object v3, v4

    move-object/from16 v4, v18

    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->j(Lcom/p1/mobile/android/app/Act;Ll/g900;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_e
    move-object v15, v2

    .line 67
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;

    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    .line 68
    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v3}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v3

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->b(Ll/n100;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void

    :sswitch_f
    move-object v15, v2

    .line 69
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 70
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v1, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    iget-object v2, v2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {v11, v0, v15, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemPlatinumPinGuideMessage;->f(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void

    :sswitch_10
    move-object v15, v2

    .line 71
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemPicCertGuide;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v1, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPicCertGuide;->e(Lcom/p1/mobile/putong/data/User;Ll/n100;)V

    return-void

    :sswitch_11
    move-object v15, v2

    .line 72
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemAiP2PChatGuide;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v1, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiP2PChatGuide;->e(Lcom/p1/mobile/putong/data/User;Ll/n100;)V

    return-void

    :sswitch_12
    move-object v15, v2

    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 78
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    goto :goto_1

    .line 79
    :cond_17
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 82
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 83
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 84
    :cond_18
    :goto_1
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;

    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->p(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    :sswitch_13
    move-object v15, v2

    .line 85
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v9, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d(ILcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    :sswitch_14
    move-object v15, v2

    .line 86
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v15, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestion;->P(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    :sswitch_15
    move-object v15, v2

    .line 87
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 88
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v15, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatAssistantQuestionAutoRight;->z(Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    :goto_2
    :sswitch_16
    move-object v15, v2

    goto/16 :goto_7

    .line 89
    :sswitch_17
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemIceBreakStateRight;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemIceBreakStateRight;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 90
    :sswitch_18
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemWoodenFishTip;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemWoodenFishTip;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_19
    move-object v15, v2

    .line 91
    check-cast v11, Lcom/p1/mobile/putong/core/newui/messages/ItemBirthdayTip;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/p1/mobile/putong/core/newui/messages/ItemBirthdayTip;->b(Lcom/p1/mobile/putong/data/User;)V

    return-void

    :sswitch_1a
    move-object v15, v2

    .line 92
    check-cast v11, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 93
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v3, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemCommonIconTitleDesClikeView;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/n100;)V

    return-void

    :sswitch_1b
    move-object v15, v2

    .line 94
    check-cast v11, Lcom/p1/mobile/putong/core/ui/mypets/view/item/ScriptMessageItem;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v11, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/mypets/view/item/ScriptMessageItem;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    return-void

    :sswitch_1c
    move-object v15, v2

    .line 95
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemSendMsgTips;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    const-string v1, "artwork"

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSendMsgTips;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void

    :sswitch_1d
    move-object v15, v2

    .line 96
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemSendMsgTips;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    const-string v1, "tag"

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSendMsgTips;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void

    :sswitch_1e
    move-object v15, v2

    .line 97
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 98
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v1, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    iget-object v3, v3, Ll/clz;->c:Ljava/lang/String;

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/n100;Ljava/lang/String;)V

    return-void

    :sswitch_1f
    move-object v15, v2

    .line 99
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 100
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v1, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    iget-object v3, v3, Ll/clz;->c:Ljava/lang/String;

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/n100;Ljava/lang/String;)V

    return-void

    :sswitch_20
    move-object v15, v2

    .line 101
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzBreakIceMessage;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 102
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-virtual {v11, v0, v15, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzBreakIceMessage;->g(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/pol;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 103
    :sswitch_21
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 104
    :sswitch_22
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_23
    move-object v15, v2

    .line 105
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemTagGuide;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTagGuide;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/n100;)V

    return-void

    :sswitch_24
    move-object v15, v2

    .line 106
    check-cast v11, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 107
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object v3, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/n100;)V

    return-void

    :sswitch_25
    move-object v15, v2

    .line 108
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-virtual {v11, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->g(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_26
    move-object v15, v2

    .line 109
    check-cast v11, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    invoke-virtual {v11, v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_27
    move-object v15, v2

    .line 110
    check-cast v11, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 111
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v3, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemFinishedChallengeView;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ll/n100;)V

    return-void

    :sswitch_28
    move-object v15, v2

    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 113
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 114
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->c(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ll/n100;)V

    return-void

    .line 115
    :sswitch_29
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_2a
    move-object v15, v2

    .line 116
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 117
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess;->g(Ll/qzz;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 118
    :sswitch_2b
    sget v0, Ll/edc0;->E1:I

    invoke-virtual {v11, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 119
    sget v1, Ll/edc0;->Q4:I

    invoke-virtual {v11, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 120
    sget v2, Ll/edc0;->r0:I

    invoke-virtual {v11, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 121
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v3

    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v3

    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    move-result v3

    if-eqz v3, :cond_19

    .line 122
    sget v3, Ll/ibc0;->b2:I

    invoke-static {v0, v3}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 123
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v3, Ll/g9c0;->g:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 124
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v3, Ll/g9c0;->i:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 125
    :cond_19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 126
    invoke-static {v13}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v1, v0, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    return-void

    .line 127
    :sswitch_2c
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->k(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_2d
    move-object v15, v2

    .line 128
    move-object v0, v11

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 129
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    invoke-virtual {v0, v15, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->h(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    goto/16 :goto_0

    .line 131
    :sswitch_2e
    check-cast v11, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetingTip;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetingTip;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 132
    :sswitch_2f
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacketNotification;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacketNotification;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_30
    move-object v15, v2

    .line 133
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;

    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->p(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    :sswitch_31
    move-object v15, v2

    .line 134
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    invoke-virtual {v11, v15, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->j(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 135
    iget-object v0, v15, Ll/g900;->j:Ljava/util/Set;

    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 136
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    move-result v0

    if-nez v0, :cond_3a

    iget-object v0, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v2, "fake_id_"

    .line 137
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 138
    iget-object v0, v15, Ll/g900;->j:Ljava/util/Set;

    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 139
    const-string v0, "e_tickle_message"

    new-array v1, v10, [Ll/sfj0$a;

    invoke-static {v0, v12, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    return-void

    :sswitch_32
    move-object v15, v2

    .line 140
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;

    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->i(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    return-void

    :sswitch_33
    move-object v15, v2

    .line 141
    move-object v2, v11

    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    iget-object v5, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->setLetterUser(Lcom/p1/mobile/putong/data/User;)V

    .line 142
    iget-object v5, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->B3()Z

    move-result v5

    if-nez v5, :cond_23

    .line 143
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    .line 144
    instance-of v5, v11, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    if-nez v5, :cond_1a

    .line 145
    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    invoke-virtual {v15, v11, v10}, Ll/g900;->L(Landroid/view/View;I)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 148
    invoke-static {v5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 149
    :cond_1a
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    iget-object v3, v0, Ll/clz;->p:Ljava/lang/String;

    .line 150
    invoke-virtual {v0}, Ll/clz;->p3()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v0

    .line 151
    invoke-virtual {v2, v1, v3, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V

    return-void

    :sswitch_34
    move-object v15, v2

    .line 152
    move-object v0, v11

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    goto/16 :goto_0

    :sswitch_35
    move-object v15, v2

    .line 153
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/p1/mobile/putong/core/ui/messages/ReminderView;->i(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void

    :sswitch_36
    move-object v15, v2

    .line 154
    move-object v0, v11

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 155
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VText;

    .line 156
    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    move-result-object v2

    instance-of v2, v2, Ll/yxz;

    if-eqz v2, :cond_16

    .line 157
    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    .line 158
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    move-result-object v2

    check-cast v2, Ll/yxz;

    .line 159
    iget-boolean v2, v2, Ll/yxz;->M1:Z

    .line 160
    iget-object v4, v15, Ll/g900;->s:Ll/clz;

    if-eqz v2, :cond_1b

    .line 161
    invoke-virtual {v4}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v2

    sget v4, Ll/g9c0;->a0:I

    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    sget v2, Ll/ibc0;->R4:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 163
    :cond_1b
    invoke-virtual {v4}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v2

    .line 164
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v4

    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 165
    sget v4, Ll/g9c0;->i:I

    goto :goto_3

    .line 166
    :cond_1c
    sget v4, Ll/g9c0;->k:I

    .line 167
    :goto_3
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    move-result v2

    .line 168
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 169
    invoke-virtual {v0, v10}, Landroid/view/View;->setBackgroundColor(I)V

    goto/16 :goto_0

    :sswitch_37
    move-object v15, v2

    .line 170
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    iget-object v1, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 171
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v2, v15, Ll/g900;->r:Ll/n100;

    invoke-virtual {v11, v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->e(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/n100;)V

    return-void

    :sswitch_38
    move-object v15, v2

    .line 172
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;

    if-nez v6, :cond_1d

    const/4 v0, 0x0

    goto :goto_4

    :cond_1d
    add-int/lit8 v0, v6, -0x1

    .line 173
    invoke-virtual {v15, v0}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v0

    .line 174
    :goto_4
    invoke-virtual {v15}, Ll/g900;->d()I

    move-result v2

    sub-int/2addr v2, v8

    if-ne v6, v2, :cond_1e

    const/4 v14, 0x0

    goto :goto_5

    :cond_1e
    add-int/lit8 v2, v6, 0x1

    invoke-virtual {v15, v2}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v14

    .line 175
    :goto_5
    invoke-virtual {v11, v15, v1, v0, v14}, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    .line 176
    :sswitch_39
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/ItemMsgRiskLayout;

    invoke-virtual {v11, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMsgRiskLayout;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void

    :sswitch_3a
    move-object v15, v2

    .line 177
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    const-string v2, "\u4f60\u597d\u5440\uff0c\u95ee\u4e2a\u95ee\u9898\uff5e\n"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 179
    :cond_1f
    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ll/n100;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_23

    .line 180
    iget-object v0, v15, Ll/g900;->r:Ll/n100;

    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ll/n100;->b(Ljava/lang/String;)V

    .line 181
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 182
    :try_start_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_20

    .line 183
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    goto :goto_6

    :cond_20
    const/4 v2, 0x0

    .line 184
    :goto_6
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 185
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->type:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :catch_0
    :cond_21
    const-string v2, "chat_question_content"

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 187
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v2

    const-string v3, "chat_question_send_side"

    const-string v4, "to"

    .line 188
    invoke-static {v3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v3

    const-string v4, "chat_question_type"

    .line 189
    invoke-static {v4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v0

    filled-new-array {v2, v3, v0}, [Ll/sfj0$a;

    move-result-object v0

    .line 190
    const-string v2, "e_chat_question_auto_send"

    invoke-static {v2, v12, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    goto/16 :goto_7

    :sswitch_3b
    move-object v15, v2

    .line 191
    invoke-virtual {v15, v1}, Ll/g900;->d0(Lcom/p1/mobile/putong/core/data/Message;)V

    goto :goto_7

    :sswitch_3c
    move-object v15, v2

    .line 192
    check-cast v11, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v11, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->p0(Lcom/p1/mobile/putong/core/data/Message;Ll/clz;)V

    return-void

    :sswitch_3d
    move-object v15, v2

    .line 193
    move-object v2, v11

    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    iget-object v5, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->setLetterUser(Lcom/p1/mobile/putong/data/User;)V

    .line 194
    iget-object v5, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    iget-object v5, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v5}, Ll/clz;->B3()Z

    move-result v5

    if-nez v5, :cond_23

    .line 195
    instance-of v1, v11, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    if-nez v1, :cond_22

    .line 196
    new-instance v1, Ljava/lang/Exception;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    invoke-virtual {v15, v11, v10}, Ll/g900;->L(Landroid/view/View;I)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 199
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 200
    :cond_22
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 201
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v1, v15, Ll/g900;->s:Ll/clz;

    .line 202
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    .line 203
    invoke-virtual {v3}, Ll/clz;->p3()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v3

    .line 204
    invoke-virtual {v2, v0, v1, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V

    return-void

    :cond_23
    :goto_7
    move v14, v9

    move/from16 v17, v13

    move-object v13, v11

    goto/16 :goto_e

    :sswitch_3e
    move-object v15, v2

    .line 205
    move-object v0, v11

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v16

    const/16 v2, 0x9a

    const/16 v3, 0x1d

    const/16 v4, 0x1c

    if-eq v9, v2, :cond_27

    if-ne v9, v4, :cond_24

    goto :goto_9

    :cond_24
    if-eq v9, v3, :cond_26

    const/16 v2, 0x9b

    if-ne v9, v2, :cond_25

    goto :goto_8

    .line 206
    :cond_25
    const-string v2, "normal"

    goto :goto_a

    .line 207
    :cond_26
    :goto_8
    const-string v2, "code"

    goto :goto_a

    .line 208
    :cond_27
    :goto_9
    const-string v2, "wx"

    .line 209
    :goto_a
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 210
    instance-of v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;

    if-eqz v5, :cond_29

    .line 211
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;

    iget-object v2, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v2}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->m(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)V

    :cond_28
    move v14, v4

    move/from16 v17, v13

    move v13, v3

    goto :goto_b

    .line 212
    :cond_29
    instance-of v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

    if-eqz v5, :cond_28

    .line 213
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

    iget-object v5, v15, Ll/g900;->s:Ll/clz;

    .line 214
    invoke-virtual {v5}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v5

    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    .line 215
    invoke-virtual {v3}, Ll/clz;->r3()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v15, Ll/g900;->s:Ll/clz;

    .line 216
    invoke-virtual {v4}, Ll/clz;->i3()Ljava/lang/String;

    move-result-object v4

    move-object v14, v3

    move-object v3, v2

    move-object v2, v5

    move-object v5, v4

    move-object v4, v14

    move/from16 v17, v13

    const/16 v13, 0x1d

    const/16 v14, 0x1c

    .line 217
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->m(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_b
    if-eq v9, v13, :cond_2b

    if-ne v9, v14, :cond_2a

    goto :goto_c

    :cond_2a
    add-int/lit8 v9, v9, -0x1

    goto :goto_d

    :cond_2b
    :goto_c
    move v9, v10

    :goto_d
    move v14, v9

    move-object/from16 v13, v16

    :goto_e
    const/16 v0, 0x29

    if-ne v14, v0, :cond_2c

    .line 218
    iget-object v0, v15, Ll/g900;->i:Ljava/util/Set;

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 219
    iget-object v0, v15, Ll/g900;->i:Ljava/util/Set;

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 220
    const-string v0, "e_assistant_send_feedback"

    invoke-static {v0, v12}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    :cond_2c
    invoke-virtual {v15, v1, v14}, Ll/g900;->h0(Lcom/p1/mobile/putong/core/data/Message;I)V

    .line 222
    invoke-virtual {v15, v1}, Ll/g900;->e0(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 223
    invoke-virtual {v15, v1, v14}, Ll/g900;->f0(Lcom/p1/mobile/putong/core/data/Message;I)V

    .line 224
    invoke-virtual {v15, v1}, Ll/g900;->g0(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 225
    :try_start_1
    move-object v0, v13

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    if-nez v6, :cond_2d

    const/4 v2, 0x0

    goto :goto_f

    :cond_2d
    add-int/lit8 v2, v6, -0x1

    .line 226
    invoke-virtual {v15, v2}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v2

    .line 227
    :goto_f
    invoke-virtual {v15}, Ll/g900;->d()I

    move-result v3

    sub-int/2addr v3, v8

    if-ne v6, v3, :cond_2e

    const/4 v3, 0x0

    goto :goto_10

    :cond_2e
    add-int/lit8 v3, v6, 0x1

    invoke-virtual {v15, v3}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v3

    .line 228
    :goto_10
    invoke-virtual {v0, v15, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 229
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->e4()Z

    move-result v0

    if-nez v0, :cond_38

    instance-of v0, v13, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;

    if-eqz v0, :cond_38

    .line 230
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Ll/r97;->s4()Z

    move-result v0

    const-string v2, "love_letter"

    if-eqz v0, :cond_2f

    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 231
    invoke-virtual {v0}, Ll/clz;->i3()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ll/clz;->k4(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_30

    :cond_2f
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    .line 232
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v3

    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v3

    invoke-interface {v3}, Ll/r97;->h()Ljava/lang/String;

    move-result-object v3

    .line 233
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_30

    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 234
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 235
    :cond_30
    :try_start_2
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v0

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, v15, Ll/g900;->f:J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    .line 236
    :catch_1
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    invoke-virtual {v0}, Ll/clz;->e4()Z

    move-result v0

    if-nez v0, :cond_33

    .line 237
    iget-object v0, v15, Ll/g900;->s:Ll/clz;

    iget-object v0, v0, Ll/clz;->r:Ll/vg60;

    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    new-instance v3, Ll/z800;

    invoke-direct {v3, v15}, Ll/z800;-><init>(Ll/g900;)V

    .line 238
    invoke-static {v0, v3}, Ll/jyb;->O(Ljava/util/List;Ll/qcj;)I

    move-result v0

    if-ne v6, v0, :cond_31

    move v0, v8

    goto :goto_11

    :cond_31
    move v0, v10

    .line 239
    :goto_11
    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    iget-object v3, v3, Ll/clz;->r:Ll/vg60;

    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 240
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v6

    .line 241
    invoke-static {v3, v4}, Ll/jyb;->m0(Ljava/util/List;I)Ljava/util/List;

    move-result-object v3

    new-instance v4, Ll/a900;

    invoke-direct {v4, v15}, Ll/a900;-><init>(Ll/g900;)V

    .line 242
    invoke-static {v3, v4}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v4, v3, :cond_32

    move v3, v8

    goto :goto_12

    :cond_32
    move v3, v10

    goto :goto_12

    :cond_33
    move v0, v10

    move v3, v0

    :goto_12
    if-eqz v3, :cond_34

    if-eqz v0, :cond_34

    .line 243
    invoke-virtual {v15, v14}, Ll/g900;->J(I)Z

    move-result v0

    if-nez v0, :cond_35

    :cond_34
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 244
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v0

    if-eqz v0, :cond_36

    :cond_35
    move v2, v8

    goto :goto_13

    :cond_36
    move v2, v10

    .line 245
    :goto_13
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    move-result v0

    if-nez v0, :cond_37

    .line 246
    move-object v0, v13

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;

    iget-object v3, v15, Ll/g900;->s:Ll/clz;

    .line 247
    invoke-virtual {v3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v3

    iget-object v4, v15, Ll/g900;->s:Ll/clz;

    iget-object v4, v4, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v6, v15, Ll/g900;->f:J

    iget-wide v8, v15, Ll/g900;->e:J

    move v5, v2

    move-object v2, v1

    move-object v1, v3

    move-object v3, v4

    move-object v4, v15

    .line 248
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->m1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ll/g900;ZJJ)V

    goto :goto_14

    :cond_37
    move v5, v2

    move-object v2, v15

    .line 249
    move-object v0, v13

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;

    iget-wide v3, v2, Ll/g900;->f:J

    move v8, v5

    iget-wide v5, v2, Ll/g900;->e:J

    move-object/from16 v1, p2

    move v2, v8

    .line 250
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->n1(Lcom/p1/mobile/putong/core/data/Message;ZJJ)V

    :cond_38
    :goto_14
    const/16 v0, 0xf5

    if-ne v14, v0, :cond_39

    .line 251
    move-object v0, v13

    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->o1()V

    :cond_39
    const/16 v0, 0xff

    if-ne v14, v0, :cond_3a

    .line 252
    check-cast v13, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;

    invoke-virtual {v13}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->l1()V

    :cond_3a
    :goto_15
    :sswitch_3f
    return-void

    :catch_2
    move-exception v0

    move-object v2, v15

    .line 253
    iget v3, v2, Ll/g900;->q:I

    if-nez v3, :cond_3b

    add-int/2addr v3, v8

    .line 254
    iput v3, v2, Ll/g900;->q:I

    .line 255
    invoke-virtual {v2, v6}, Ll/g900;->p(I)I

    move-result v0

    .line 256
    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1, v0}, Ll/g900;->w(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v1

    .line 257
    invoke-virtual {v2, v6}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v3

    invoke-virtual {v2, v1, v3, v0, v6}, Ll/g900;->a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V

    return-void

    .line 258
    :cond_3b
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "MessagesAdapter error: \nuserId: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\ncid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    invoke-virtual {v2, v6}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v4

    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\nposition: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "\nmessage id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\nmessageType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    invoke-virtual {v2, v6}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v4

    invoke-virtual {v2, v4, v6}, Ll/g900;->Q(Lcom/p1/mobile/putong/core/data/Message;I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "\nremote messageType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "\nview: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\ncontentView: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    instance-of v4, v13, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    if-eqz v4, :cond_3c

    .line 267
    check-cast v13, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;

    invoke-virtual {v13}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->getContentLayoutInfo()Ljava/lang/String;

    move-result-object v4

    goto :goto_16

    .line 268
    :cond_3c
    const-string v4, "null"

    .line 269
    :goto_16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\nrenderType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "\nmessageDetail:\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->toJson()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-lez v6, :cond_3d

    .line 272
    const-string v5, "pre msgType: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v6, -0x1

    .line 273
    invoke-virtual {v2, v5}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v9

    invoke-virtual {v2, v9, v5}, Ll/g900;->Q(Lcom/p1/mobile/putong/core/data/Message;I)I

    move-result v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "\npre remote messageType: "

    .line 274
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    invoke-virtual {v2, v5}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v5

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 276
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    :cond_3d
    invoke-virtual {v2}, Ll/g900;->d()I

    move-result v5

    sub-int/2addr v5, v8

    if-ge v6, v5, :cond_3e

    .line 278
    const-string v5, "next msgType: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v6, 0x1

    .line 279
    invoke-virtual {v2, v5}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v9

    invoke-virtual {v2, v9, v5}, Ll/g900;->Q(Lcom/p1/mobile/putong/core/data/Message;I)I

    move-result v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "\nnext remote messageType: "

    .line 280
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    invoke-virtual {v2, v5}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v5

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 282
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    :cond_3e
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 284
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-lez v6, :cond_3f

    add-int/lit8 v1, v6, -0x1

    .line 285
    invoke-virtual {v2, v1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    invoke-interface {v4, v10, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_3f
    if-le v6, v8, :cond_40

    add-int/lit8 v1, v6, -0x2

    .line 286
    invoke-virtual {v2, v1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    invoke-interface {v4, v10, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_40
    if-le v6, v7, :cond_41

    add-int/lit8 v1, v6, -0x3

    .line 287
    invoke-virtual {v2, v1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    invoke-interface {v4, v10, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_41
    add-int/lit8 v1, v6, 0x1

    .line 288
    invoke-virtual {v2}, Ll/g900;->d()I

    move-result v5

    if-ge v1, v5, :cond_42

    .line 289
    invoke-virtual {v2, v1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_42
    add-int/lit8 v1, v6, 0x2

    .line 290
    invoke-virtual {v2}, Ll/g900;->d()I

    move-result v5

    if-ge v1, v5, :cond_43

    .line 291
    invoke-virtual {v2, v1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_43
    add-int/lit8 v1, v6, 0x3

    .line 292
    invoke-virtual {v2}, Ll/g900;->d()I

    move-result v5

    if-ge v1, v5, :cond_44

    .line 293
    invoke-virtual {v2, v1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    :cond_44
    const-string v1, "historyBottomMessages: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v10

    .line 295
    :goto_17
    iget-object v5, v2, Ll/g900;->u:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const-string v6, "), "

    const-string v7, ", "

    const-string v8, "("

    if-ge v1, v5, :cond_45

    .line 296
    iget-object v5, v2, Ll/g900;->u:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    .line 297
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 298
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 300
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 301
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 302
    :cond_45
    const-string v1, "\nnowBottomMessages: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    :goto_18
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_46

    .line 304
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 305
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 306
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 308
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 309
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v10, v10, 0x1

    goto :goto_18

    .line 310
    :cond_46
    const-string v1, "\ncrash caused by: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 313
    throw v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3e
        0x16 -> :sswitch_3e
        0x1b -> :sswitch_3d
        0x1c -> :sswitch_3e
        0x1d -> :sswitch_3e
        0x27 -> :sswitch_3e
        0x3f -> :sswitch_3c
        0x44 -> :sswitch_3f
        0x46 -> :sswitch_3e
        0x47 -> :sswitch_3b
        0x5b -> :sswitch_3e
        0x61 -> :sswitch_3f
        0x65 -> :sswitch_3a
        0x68 -> :sswitch_39
        0x6a -> :sswitch_38
        0x6d -> :sswitch_37
        0x8d -> :sswitch_3e
        0x8e -> :sswitch_36
        0x8f -> :sswitch_36
        0x90 -> :sswitch_36
        0x91 -> :sswitch_35
        0x93 -> :sswitch_34
        0x94 -> :sswitch_34
        0x95 -> :sswitch_34
        0x99 -> :sswitch_33
        0x9a -> :sswitch_3e
        0x9b -> :sswitch_3e
        0xab -> :sswitch_32
        0xaf -> :sswitch_31
        0xb0 -> :sswitch_32
        0xb6 -> :sswitch_30
        0xb8 -> :sswitch_2f
        0xbc -> :sswitch_2e
        0xbd -> :sswitch_2d
        0xc0 -> :sswitch_2c
        0xc1 -> :sswitch_32
        0xc2 -> :sswitch_2b
        0xc3 -> :sswitch_2a
        0xc5 -> :sswitch_32
        0xc6 -> :sswitch_29
        0xc9 -> :sswitch_3b
        0xca -> :sswitch_36
        0xcb -> :sswitch_34
        0xcf -> :sswitch_28
        0xd0 -> :sswitch_28
        0xd1 -> :sswitch_3f
        0xd7 -> :sswitch_27
        0xd9 -> :sswitch_26
        0xda -> :sswitch_25
        0xdc -> :sswitch_24
        0xde -> :sswitch_36
        0xdf -> :sswitch_23
        0xe2 -> :sswitch_36
        0xe3 -> :sswitch_34
        0xe4 -> :sswitch_22
        0xe7 -> :sswitch_21
        0xea -> :sswitch_20
        0xeb -> :sswitch_1f
        0xec -> :sswitch_1e
        0xed -> :sswitch_1d
        0xee -> :sswitch_1c
        0xef -> :sswitch_3f
        0xf0 -> :sswitch_1b
        0xf1 -> :sswitch_1a
        0xf2 -> :sswitch_19
        0xf3 -> :sswitch_18
        0xf4 -> :sswitch_17
        0xf6 -> :sswitch_16
        0xf7 -> :sswitch_15
        0xf8 -> :sswitch_14
        0xf9 -> :sswitch_13
        0xfb -> :sswitch_12
        0xfc -> :sswitch_13
        0xfd -> :sswitch_11
        0x100 -> :sswitch_10
        0x101 -> :sswitch_f
        0x102 -> :sswitch_e
        0x105 -> :sswitch_d
        0x106 -> :sswitch_c
        0x109 -> :sswitch_b
        0x10a -> :sswitch_a
        0x10b -> :sswitch_9
        0x10c -> :sswitch_8
        0x10d -> :sswitch_7
        0x10e -> :sswitch_6
        0x110 -> :sswitch_5
        0x112 -> :sswitch_4
        0x113 -> :sswitch_3
        0x114 -> :sswitch_2
        0x116 -> :sswitch_1
        0x117 -> :sswitch_0
    .end sparse-switch
.end method

.method public a0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 2
    .line 3
    iget-object p0, p0, Ll/clz;->r:Ll/vg60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public b0(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string p1, "chat_assistant_question"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/r97;->v5()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public c0(Ll/vg60;Lcom/p1/mobile/putong/core/data/Reminder;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Reminder;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/l900;->r()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/g900$a;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/g900$a;-><init>(Ll/g900;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-boolean v0, p0, Ll/g900;->h:Z

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v0}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 50
    .line 51
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    const/4 v3, 0x1

    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-nez v2, :cond_2

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 71
    .line 72
    iget-wide v6, p2, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 73
    .line 74
    cmpg-double v0, v4, v6

    .line 75
    .line 76
    if-gez v0, :cond_2

    .line 77
    .line 78
    :cond_1
    move v0, v3

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    move v0, v1

    .line 81
    :goto_0
    iput-boolean v0, p0, Ll/g900;->g:Z

    .line 82
    .line 83
    iput-boolean v3, p0, Ll/g900;->h:Z

    .line 84
    .line 85
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-interface {v0}, Ll/r97;->j()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 106
    .line 107
    const-wide/16 v4, 0x0

    .line 108
    .line 109
    cmpg-double v0, v2, v4

    .line 110
    .line 111
    if-gtz v0, :cond_4

    .line 112
    .line 113
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_4

    .line 124
    .line 125
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 132
    .line 133
    new-instance v2, Ll/d900;

    .line 134
    .line 135
    invoke-direct {v2}, Ll/d900;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_4

    .line 147
    .line 148
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {v0}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 155
    .line 156
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_4

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-eqz v2, :cond_4

    .line 167
    .line 168
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 169
    .line 170
    if-nez v2, :cond_4

    .line 171
    .line 172
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 173
    .line 174
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 175
    .line 176
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/api/g;->mn(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 177
    .line 178
    .line 179
    :cond_4
    iget-boolean v0, p0, Ll/g900;->g:Z

    .line 180
    .line 181
    if-eqz v0, :cond_5

    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iget-wide v2, p2, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 188
    .line 189
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 190
    .line 191
    iget-object v2, p0, Ll/g900;->s:Ll/clz;

    .line 192
    .line 193
    invoke-virtual {v2}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 198
    .line 199
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 202
    .line 203
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    .line 204
    .line 205
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 206
    .line 207
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

    .line 208
    .line 209
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 210
    .line 211
    new-instance p2, Ljava/util/ArrayList;

    .line 212
    .line 213
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 214
    .line 215
    invoke-direct {p2, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 216
    .line 217
    .line 218
    new-instance v2, Ll/e900;

    .line 219
    .line 220
    invoke-direct {v2}, Ll/e900;-><init>()V

    .line 221
    .line 222
    .line 223
    invoke-static {p2, v0, v2}, Ll/jyb;->g0(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_5
    const/4 p2, 0x0

    .line 228
    :goto_1
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 229
    .line 230
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-nez v0, :cond_7

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-interface {v0}, Ll/r97;->s4()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_7

    .line 249
    .line 250
    iget-object v0, p0, Ll/g900;->s:Ll/clz;

    .line 251
    .line 252
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-virtual {v0, v2}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-nez v0, :cond_7

    .line 261
    .line 262
    iget-boolean v0, p0, Ll/g900;->g:Z

    .line 263
    .line 264
    if-eqz v0, :cond_6

    .line 265
    .line 266
    move-object v0, p2

    .line 267
    goto :goto_2

    .line 268
    :cond_6
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 269
    .line 270
    :goto_2
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_7

    .line 275
    .line 276
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-eqz v0, :cond_7

    .line 281
    .line 282
    iget-wide v2, p3, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 283
    .line 284
    double-to-long v2, v2

    .line 285
    iput-wide v2, p0, Ll/g900;->e:J

    .line 286
    .line 287
    :cond_7
    iget-object p3, p0, Ll/g900;->u:Ljava/util/List;

    .line 288
    .line 289
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 290
    .line 291
    .line 292
    move-result p3

    .line 293
    if-eqz p3, :cond_9

    .line 294
    .line 295
    iget-object p3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 296
    .line 297
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 298
    .line 299
    .line 300
    move-result p3

    .line 301
    if-nez p3, :cond_9

    .line 302
    .line 303
    iget-object p3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 304
    .line 305
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 306
    .line 307
    .line 308
    move-result p3

    .line 309
    const/16 v0, 0xa

    .line 310
    .line 311
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 312
    .line 313
    .line 314
    move-result p3

    .line 315
    :goto_3
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 316
    .line 317
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    if-ge v1, v2, :cond_9

    .line 326
    .line 327
    :try_start_0
    iget-object v2, p0, Ll/g900;->u:Ljava/util/List;

    .line 328
    .line 329
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 330
    .line 331
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v3

    .line 335
    check-cast v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 336
    .line 337
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    .line 339
    .line 340
    goto :goto_5

    .line 341
    :catch_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 342
    .line 343
    const-string v3, "MessagesAdapter.render IndexOutOfBoundsException currentThread = "

    .line 344
    .line 345
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v3

    .line 356
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v3, ",  userId = "

    .line 360
    .line 361
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    iget-object v3, p0, Ll/g900;->s:Ll/clz;

    .line 365
    .line 366
    invoke-virtual {v3}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result v3

    .line 374
    if-eqz v3, :cond_8

    .line 375
    .line 376
    iget-object v3, p0, Ll/g900;->s:Ll/clz;

    .line 377
    .line 378
    invoke-virtual {v3}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 379
    .line 380
    .line 381
    move-result-object v3

    .line 382
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 383
    .line 384
    goto :goto_4

    .line 385
    :cond_8
    const-string v3, "null"

    .line 386
    .line 387
    :goto_4
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    const-string v3, ",  oldSize = "

    .line 391
    .line 392
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    const-string v3, ",  currentSize = "

    .line 399
    .line 400
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 404
    .line 405
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 406
    .line 407
    .line 408
    move-result v3

    .line 409
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 410
    .line 411
    .line 412
    move-result v3

    .line 413
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    const-string v3, ",  index = "

    .line 417
    .line 418
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    const-string v3, ",  list = "

    .line 425
    .line 426
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 430
    .line 431
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v2

    .line 442
    new-instance v3, Ljava/lang/Exception;

    .line 443
    .line 444
    invoke-direct {v3, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 445
    .line 446
    .line 447
    invoke-static {v3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 448
    .line 449
    .line 450
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 451
    .line 452
    goto/16 :goto_3

    .line 453
    .line 454
    :cond_9
    iget-object p3, p0, Ll/g900;->s:Ll/clz;

    .line 455
    .line 456
    new-instance v0, Ll/vg60;

    .line 457
    .line 458
    iget-boolean v1, p0, Ll/g900;->g:Z

    .line 459
    .line 460
    if-eqz v1, :cond_a

    .line 461
    .line 462
    goto :goto_6

    .line 463
    :cond_a
    iget-object p2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 464
    .line 465
    :goto_6
    invoke-static {p2}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    .line 466
    .line 467
    .line 468
    move-result-object p2

    .line 469
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 470
    .line 471
    invoke-direct {v0, p2, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 472
    .line 473
    .line 474
    iput-object v0, p3, Ll/clz;->r:Ll/vg60;

    .line 475
    .line 476
    invoke-virtual {p0}, Ll/l900;->y()V

    .line 477
    .line 478
    .line 479
    const-string p1, "samsung"

    .line 480
    .line 481
    sget-object p2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 482
    .line 483
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 484
    .line 485
    .line 486
    move-result p1

    .line 487
    if-eqz p1, :cond_b

    .line 488
    .line 489
    const-string p1, "GT-I9208"

    .line 490
    .line 491
    sget-object p2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 492
    .line 493
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 494
    .line 495
    .line 496
    move-result p1

    .line 497
    if-eqz p1, :cond_b

    .line 498
    .line 499
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 500
    .line 501
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    const/16 p1, 0x10

    .line 510
    .line 511
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 512
    .line 513
    .line 514
    :cond_b
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g900;->a0()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final d0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g900;->n:Ljava/util/Set;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/g900;->n:Ljava/util/Set;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/b900;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ll/b900;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/c900;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Ll/c900;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    if-gt p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/g900;->s:Ll/clz;

    .line 5
    .line 6
    iget-object p1, p1, Ll/clz;->r:Ll/vg60;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Bn(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final e0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hr()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "tantan://profile/edit?type=continuousEdit"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/g900;->l:Ljava/util/Set;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/g900;->l:Ljava/util/Set;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    const-string p0, "e_assistant_update_profile"

    .line 43
    .line 44
    const-string p1, "p_chat_view"

    .line 45
    .line 46
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final f0(Lcom/p1/mobile/putong/core/data/Message;I)V
    .locals 1

    .line 1
    const/16 v0, 0x45

    .line 2
    .line 3
    if-eq p2, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0xc8

    .line 6
    .line 7
    if-ne p2, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object p2, p0, Ll/g900;->m:Ljava/util/Set;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/g900;->m:Ljava/util/Set;

    .line 20
    .line 21
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/pf60;

    .line 27
    .line 28
    const-string p2, "state_id"

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {p0, p2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    new-instance p2, Ll/pf60;

    .line 36
    .line 37
    const-string v0, "owner_id"

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p2, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    filled-new-array {p0, p2}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "e_other_state"

    .line 49
    .line 50
    const-string p2, "p_chat_view"

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "question"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/g900;->r:Ll/n100;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/g900;->r:Ll/n100;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "question_id"

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    filled-new-array {p0}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "e_message_question"

    .line 45
    .line 46
    const-string v0, "p_chat_view"

    .line 47
    .line 48
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final h0(Lcom/p1/mobile/putong/core/data/Message;I)V
    .locals 6

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/g900;->k:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    const-string v0, "enterSuggestVoiceRoom"

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/g900;->k:Ljava/util/Set;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/pf60;

    .line 35
    .line 36
    const-string p0, "audio_card_type"

    .line 37
    .line 38
    const-string p1, "message_audio_assistant"

    .line 39
    .line 40
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/pf60;

    .line 44
    .line 45
    const-string p0, "liveId"

    .line 46
    .line 47
    const-string p1, ""

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/pf60;

    .line 53
    .line 54
    const-string p0, "anchorId"

    .line 55
    .line 56
    invoke-direct {v2, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    new-instance v3, Ll/pf60;

    .line 60
    .line 61
    const-string p0, "topic_id"

    .line 62
    .line 63
    invoke-direct {v3, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    new-instance v4, Ll/pf60;

    .line 67
    .line 68
    const-string p0, "audio_room_type"

    .line 69
    .line 70
    invoke-direct {v4, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    new-instance v5, Ll/pf60;

    .line 74
    .line 75
    const-string p0, "extra_info"

    .line 76
    .line 77
    const-string p1, "active_gift"

    .line 78
    .line 79
    invoke-direct {v5, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    filled-new-array/range {v0 .. v5}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string p1, "e_live_audio_room_enter"

    .line 87
    .line 88
    const-string p2, "p_chat_view"

    .line 89
    .line 90
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    :cond_0
    return-void
.end method

.method public m(I)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g900;->s:Ll/clz;

    .line 2
    .line 3
    iget-object p0, p0, Ll/clz;->r:Ll/vg60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 12
    .line 13
    return-object p0
.end method

.method public p(I)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/g900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1}, Ll/g900;->Q(Lcom/p1/mobile/putong/core/data/Message;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const/16 v0, 0xf

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/16 p0, 0x74

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/16 p0, 0xc

    .line 27
    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/16 v0, 0xa

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/16 p0, 0x80

    .line 43
    .line 44
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    const/4 p0, 0x2

    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    const/16 p0, 0x76

    .line 62
    .line 63
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    const/16 p0, 0xb6

    .line 72
    .line 73
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/16 v0, 0x14

    .line 78
    .line 79
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    filled-new-array/range {v1 .. v7}, [Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method

.method public w(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/g900;->U(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
