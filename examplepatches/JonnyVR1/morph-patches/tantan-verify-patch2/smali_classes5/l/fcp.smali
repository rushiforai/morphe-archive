.class public Ll/fcp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fcp$a;
    }
.end annotation


# static fields
.field public static f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static g:Z

.field public static h:Ll/jxd0;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/gcg0;

.field public c:Ll/mxd0;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public e:D


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/fcp;->f:Lrx/subjects/a;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput-boolean v0, Ll/fcp;->g:Z

    .line 9
    .line 10
    new-instance v0, Ll/jxd0;

    .line 11
    .line 12
    const-string v1, "see_letter_cover_home_guide_shown"

    .line 13
    .line 14
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/fcp;->h:Ll/jxd0;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/fcp;->a:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 9
    .line 10
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/fcp;->d:Lrx/subjects/a;

    .line 15
    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    iput-wide v0, p0, Ll/fcp;->e:D

    .line 19
    .line 20
    return-void
.end method

.method public synthetic constructor <init>(Ll/gcp;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ll/fcp;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/fcp;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcp;->q(Ll/vg60;)V

    return-void
.end method

.method public static synthetic b(Ll/vg60;Ll/uxj0;)Ll/vg60;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ll/fcp;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcp;->r(Ll/vg60;)V

    return-void
.end method

.method public static synthetic d(Ll/fcp;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcp;->s(Ll/vg60;)V

    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Tf(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static i()Ll/fcp;
    .locals 1

    .line 1
    invoke-static {}, Ll/fcp$a;->a()Ll/fcp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static j()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->E3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/a5i0;->G()Z

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
    const/4 v0, 0x0

    .line 15
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 17
    return v0
.end method

.method public static k(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "-770011"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 30
    .line 31
    const-string v0, "intlSvipLetterC"

    .line 32
    .line 33
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public static m(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Ll/fcp;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method public static n(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/fcp;->m(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static o(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/fcp;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "oneSide"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static p(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/fcp;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/joa;->E3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/rbb0;->i()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-lez v0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Ll/a5i0;->G()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p2}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {p0, p1}, Ll/a5i0;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    invoke-interface {p2, p0, p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/d79;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    invoke-static {v0}, Ll/fcp;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 54
    .line 55
    const-string v2, "oneSide"

    .line 56
    .line 57
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_0

    .line 82
    .line 83
    const-string v1, "matchList"

    .line 84
    .line 85
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    const-string v1, "both"

    .line 93
    .line 94
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    const-string v1, "none"

    .line 102
    .line 103
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    return-void
.end method

.method public static x()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9HUlRRNlhDUlpQSlo3WUNZNDc1WFhGTURJRE00VzA2IiwidyI6MTMyNCwiaCI6MTE2MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjQyNTIyOTAyNTU5MDkxMTg3NzN9.png"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9LREtLVUk2U1FYSjZaRFkzVlhGSDVOMlI0UkRRWTA2IiwidyI6MTMyNCwiaCI6MTE2MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjQyNTIzMDMxMjM0Mjc5NjM2ODl9.png"

    .line 11
    .line 12
    return-object v0
.end method

.method public static y()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/fcp;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Ll/fcp;->f:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return v0
.end method

.method public static z()Z
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Ll/d79;->j0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-static {}, Ll/rbb0;->i()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    const-wide/16 v4, 0x0

    .line 20
    .line 21
    cmp-long v0, v2, v4

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    return v2

    .line 27
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_4

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 46
    .line 47
    double-to-long v5, v5

    .line 48
    invoke-static {v3, v4, v5, v6, v2}, Ll/tzi0;->h(JJI)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    return v2

    .line 55
    :cond_2
    invoke-static {}, Ll/nmp;->f()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    return v2

    .line 62
    :cond_3
    sget-boolean v0, Ll/fcp;->g:Z

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    return v2

    .line 67
    :cond_4
    return v1
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fcp;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/fcp;->b:Ll/gcg0;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Ap()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Ll/fcp;->d:Lrx/subjects/a;

    .line 16
    .line 17
    new-instance v3, Ll/bcp;

    .line 18
    .line 19
    invoke-direct {v3}, Ll/bcp;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ll/ccp;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/ccp;-><init>(Ll/fcp;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fcp;->c:Ll/mxd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/mxd0;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "lastClickSetItemTimestamp_"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    invoke-direct {v0, v1, v2, v3}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/fcp;->c:Ll/mxd0;

    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/fcp;->c:Ll/mxd0;

    .line 41
    .line 42
    iget-wide v1, p0, Ll/fcp;->e:D

    .line 43
    .line 44
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/fcp;->d:Lrx/subjects/a;

    .line 52
    .line 53
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fcp;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic q(Ll/vg60;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/d79;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "-770011"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ef(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {p1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    sput-boolean v0, Ll/fcp;->g:Z

    .line 33
    .line 34
    sget-object v0, Ll/fcp;->f:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Boolean;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-ne v0, v2, :cond_2

    .line 47
    .line 48
    :cond_1
    invoke-static {}, Ll/fcp;->y()Z

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    const-string v0, "none"

    .line 58
    .line 59
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 64
    .line 65
    const-string v0, "conversation_type_see_letter"

    .line 66
    .line 67
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 68
    .line 69
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 70
    .line 71
    iput-wide v0, p0, Ll/fcp;->e:D

    .line 72
    .line 73
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->po()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 82
    .line 83
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ef(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic r(Ll/vg60;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/ecp;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/ecp;-><init>(Ll/fcp;Ll/vg60;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic s(Ll/vg60;)V
    .locals 1

    .line 1
    new-instance v0, Ll/dcp;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dcp;-><init>(Ll/fcp;Ll/vg60;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/fcp;->a:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fcp;->b:Ll/gcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/fcp;->b:Ll/gcg0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/gcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/fcp;->b:Ll/gcg0;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    sput-boolean v0, Ll/fcp;->g:Z

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/fcp;->c:Ll/mxd0;

    .line 25
    .line 26
    return-void
.end method
