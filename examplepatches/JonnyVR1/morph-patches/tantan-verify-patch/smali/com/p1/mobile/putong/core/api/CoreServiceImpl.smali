.class public Lcom/p1/mobile/putong/core/api/CoreServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreService\u670d\u52a1"
    path = "/core_service/service"
.end annotation


# instance fields
.field public a:Ll/m2;

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nv6;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nv6;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl;->a:Ll/m2;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic F(Ll/y20;Lcom/p1/mobile/putong/data/StickerInfo;)V
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
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic H(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_0

    .line 40
    .line 41
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, p0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 65
    .line 66
    .line 67
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->h6:I

    .line 68
    .line 69
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 73
    .line 74
    new-instance p1, Ll/jxa;

    .line 75
    .line 76
    invoke-direct {p1}, Ll/jxa;-><init>()V

    .line 77
    .line 78
    .line 79
    const-wide/16 v0, 0x32

    .line 80
    .line 81
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v5, ""

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Ll/uwk;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M(Lcom/tantanapp/common/data/JsonAdapter;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/data/ConversationStatus;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "deleted"

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic P(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/pf60;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic S()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-lt p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;->a2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic W(Lcom/tantanapp/common/data/JsonAdapter;Lcom/p1/mobile/putong/core/data/Message;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X(Lcom/tantanapp/common/data/JsonAdapter;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y(Lcom/tantanapp/common/data/JsonAdapter;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a0(Ljava/lang/String;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/wyb0;->i0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "remainingtimes"

    .line 21
    .line 22
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/wyb0;->R()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "voicechat_results"

    .line 34
    .line 35
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string v0, "e_voicechat_button"

    .line 39
    .line 40
    invoke-static {v0, p0, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public static synthetic b0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->jg(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->rf(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

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
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 14
    .line 15
    const-string v0, "default"

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-static {p0, p1, p2, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 33
    .line 34
    const-string v0, "from_virtual_voice"

    .line 35
    .line 36
    invoke-direct {p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p1, "p_audio,greet"

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 42
    .line 43
    .line 44
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
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
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 11
    .line 12
    const p1, 0x9d87

    .line 13
    .line 14
    .line 15
    if-ne p0, p1, :cond_0

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g6:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 29
    .line 30
    new-instance p1, Ll/ixa;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/ixa;-><init>()V

    .line 33
    .line 34
    .line 35
    const-wide/16 v0, 0x32

    .line 36
    .line 37
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public Ap(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/j1a;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p3, p4, p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public B6()V
    .locals 0

    .line 1
    invoke-static {}, Ll/m6i;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ba()Ll/jxd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->L6:Ll/jxd0;

    .line 6
    .line 7
    return-object p0
.end method

.method public Br()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/xra;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Cb(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Ch()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qap$a;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Dd()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->i:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Dh()Z
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qap$a;->p()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Dm()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/y2h0;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Dp()Z
    .locals 0

    .line 1
    sget-object p0, Ll/for;->INSTANCE:Ll/for;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/for;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E5(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->E5(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public F0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "diamond"

    .line 2
    .line 3
    return-object p0
.end method

.method public F2()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "platinum"

    .line 2
    .line 3
    return-object p0
.end method

.method public Fc(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StickerInfo;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/z$c;->R(Lcom/p1/mobile/putong/data/StickerInfo;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/sxa;

    .line 16
    .line 17
    invoke-direct {p1, p3}, Ll/sxa;-><init>(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Ll/txa;

    .line 21
    .line 22
    invoke-direct {p2}, Ll/txa;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public Ff(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_0

    .line 65
    .line 66
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    const/16 v0, 0x12c

    .line 93
    .line 94
    if-lt p0, v0, :cond_0

    .line 95
    .line 96
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Sticker;->new_()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/data/Sticker;->mergeDataFromStickerInfo(Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 107
    .line 108
    .line 109
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 110
    .line 111
    const/4 v0, 0x1

    .line 112
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 113
    .line 114
    .line 115
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 118
    .line 119
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 120
    .line 121
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/z$c;->O(Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    new-instance v0, Ll/aya;

    .line 130
    .line 131
    invoke-direct {v0, p0, p1}, Ll/aya;-><init>(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/android/app/Act;)V

    .line 132
    .line 133
    .line 134
    new-instance p0, Ll/bya;

    .line 135
    .line 136
    invoke-direct {p0, p1}, Ll/bya;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public Fo(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/ui/settings/privacyandpremisson/PrivacyAndPremissonAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Gb(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/zki0;->E(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Gn()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/hlh0;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Hp(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/bt0;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ia(Lcom/p1/mobile/putong/data/User;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    long-to-double v1, v1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-static {p1}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 27
    .line 28
    .line 29
    move-result-wide p0

    .line 30
    long-to-double p0, p0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 33
    .line 34
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 35
    .line 36
    :goto_0
    sub-double/2addr v1, p0

    .line 37
    const-wide p0, 0x41124f8000000000L    # 300000.0

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    cmpg-double p0, v1, p0

    .line 43
    .line 44
    if-gez p0, :cond_2

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_2
    return v0
.end method

.method public Ic()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->T2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Id()I
    .locals 0

    .line 1
    sget p0, Ll/m6i;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public Ij(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 2
    .line 3
    invoke-direct {p0, p2, p5}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->m(Ljava/lang/Object;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2, p6}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2, p7}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->j(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2, p8}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->k(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 23
    .line 24
    .line 25
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public Io(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/f760;->Companion:Ll/f760$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f760$a;->q(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Jn()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public Jq()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o7a;->G3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Js()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ovb0<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o7a;->D3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public K9(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/t600;->V(Ljava/lang/String;Ljava/util/List;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Kg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ll/y20;)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    sget p0, Ll/kec0;->G3:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    .line 9
    .line 10
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->H(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public Km(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/ui/settings/IntlSettingGenderAct;->Companion:Lcom/p1/mobile/putong/core/ui/settings/IntlSettingGenderAct$a;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/IntlSettingGenderAct$a;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SettingGroups;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/16 p2, 0x12

    .line 20
    .line 21
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public Lk(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public Lo()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->P0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public M2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->n3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p1, p2, v0, p3}, Ll/pdi;->b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, v0, p3}, Ll/wgx;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public M9(Ljava/lang/String;)Lrx/c;
    .locals 0
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
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/exa;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/exa;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public Md()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->R1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Mq(Ljava/lang/Long;)V
    .locals 2

    .line 1
    sget-object p0, Ll/f760;->Companion:Ll/f760$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/f760$a;->n(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Ne(Ljava/lang/Long;)V
    .locals 2

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/qap$a;->u(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Ng(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->setPageId(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public Ni(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v2, "feed"

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    move-object v3, p2

    .line 9
    move-object v4, p3

    .line 10
    move-object v5, p4

    .line 11
    invoke-virtual/range {v0 .. v5}, Ll/of7;->D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public O1()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "partner"

    .line 2
    .line 3
    return-object p0
.end method

.method public Oa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {p0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-static {}, Ll/syu;->h()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/lxa;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/lxa;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public Pg()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o7a;->z3()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Pq(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->u7(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Ps(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZLjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p13}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->z2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZLjava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->l1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Q7(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/j1a;->p(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q9(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;)Ll/pej0;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p15}, Ll/qtk;->R0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;)Ll/pej0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Qf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzm0;->q()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public Rb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Rp(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qap$a;->w(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Rs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p7}, Ll/bmg;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;ZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Sa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {p1, p2, p3, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Sr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/xtj0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ug(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Us(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Channel;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p7}, Ll/j1a;->y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Vr()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->S2:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wyd0;->clear()Z

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object p0, p0, Ll/dkb;->T2:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/byd0;->clear()Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public W2()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {p0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-static {}, Ll/syu;->h()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/sb8;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/sb8;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v0, Ll/nxa;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/nxa;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public Wp()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Wq()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Xd()V
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qap$a;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y3()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vip"

    .line 2
    .line 3
    return-object p0
.end method

.method public Y6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/roam/VipRoamLocationAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Yn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 2
    .line 3
    invoke-direct {p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2, p6}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->k(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2, p7}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->p(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public Z3(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public Zb(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/ji30;->o(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public a()Ll/tq8;
    .locals 0

    .line 1
    invoke-static {}, Ll/uq8;->l()Ll/uq8;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public aa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 2
    .line 3
    invoke-direct {p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2, p6}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->k(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2, p7}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->p(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p0, p8}, Lcom/p1/mobile/putong/core/ui/greet/d;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public ab(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/ConversationStatus;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/cxa;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/cxa;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public alipayAuthWithErrorCode(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alipay/sdk/app/AuthTask;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lqb;->k4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public as(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "FeedPostStateGuideBottomSheetDialog"

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b3()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b6(Lcom/p1/mobile/android/app/Act;Landroid/widget/EditText;ZLl/y20;Z)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/widget/EditText;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;Z)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    sget p0, Ll/kec0;->t1:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 9
    .line 10
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->D(Landroid/widget/EditText;ZLl/y20;Z)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public blocks(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->se(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bs(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->d(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c9(Landroid/view/View;I)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->setViewGone(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public ci(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/i;->D3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public ck()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public clearCounterUnread()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->g3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearCounterUnreadExceptFansForUI1()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->h3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearCounterViewersUnread()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->i3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearRequests(Ljava/lang/String;I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequests(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearUnReadLikes()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->k3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearUnreadFans()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->j3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public confirmThenUnmatch(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->v1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public counter()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Counter;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public counter_()Lcom/p1/mobile/putong/data/Counter;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public cs()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/tza0;->b()Ll/tza0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/tza0;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d2(Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;)Ll/lb2;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/widget/EditText;",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ll/x20;",
            ")",
            "Ll/lb2;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/w0r;

    .line 2
    .line 3
    new-instance v3, Ll/hxa;

    .line 4
    .line 5
    invoke-direct {v3}, Ll/hxa;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v8, 0x1

    .line 9
    move-object v1, p1

    .line 10
    move-object v2, p2

    .line 11
    move-object v4, p3

    .line 12
    move-object v5, p4

    .line 13
    move-object v6, p5

    .line 14
    move-object v7, p6

    .line 15
    invoke-direct/range {v0 .. v8}, Ll/w0r;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;Z)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public db(Lcom/p1/mobile/android/ui/label/LabelStyle;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelStyle;->MAX:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget p0, Ll/dbc0;->Hg:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 9
    .line 10
    if-ne p1, p0, :cond_1

    .line 11
    .line 12
    sget p0, Ll/dbc0;->Ig:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 16
    .line 17
    if-ne p1, p0, :cond_2

    .line 18
    .line 19
    sget p0, Ll/dbc0;->Jg:I

    .line 20
    .line 21
    return p0

    .line 22
    :cond_2
    sget p0, Ll/dbc0;->Hg:I

    .line 23
    .line 24
    return p0
.end method

.method public deleteConversationAndRelated(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v0, Ll/bxa;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/bxa;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public dg(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 41
    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    return-object p0
.end method

.method public dismissGpBindPhoneRedDot()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->e0:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public dk(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/qap$a;->v(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public dl(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->Y1(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public doGPPayment(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Merchandise;->new_()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v1, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/data/Merchandise;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    move-object v0, p2

    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception p2

    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    new-instance p2, Ll/hso;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_LIVE_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    invoke-static {v1}, Ll/wci0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {p2, p1, v1}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$a;

    .line 31
    .line 32
    invoke-direct {v1, p0, p3, p4}, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$a;-><init>(Lcom/p1/mobile/putong/core/api/CoreServiceImpl;Ll/x20;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v1}, Ll/hso;->t(Ll/bn50;)V

    .line 36
    .line 37
    .line 38
    instance-of p0, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    move-object p0, p1

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    :goto_1
    invoke-static {p1, p0}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object p3, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 64
    .line 65
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 66
    .line 67
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-virtual {p2, p0, p1, p3}, Ll/hso;->p(Ll/aso;ZLjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public e9(Lcom/p1/mobile/android/ui/label/LabelStyle;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelStyle;->MAX:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget p0, Ll/dbc0;->Kg:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 9
    .line 10
    if-ne p1, p0, :cond_1

    .line 11
    .line 12
    sget p0, Ll/dbc0;->Lg:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 16
    .line 17
    if-ne p1, p0, :cond_2

    .line 18
    .line 19
    sget p0, Ll/dbc0;->Mg:I

    .line 20
    .line 21
    return p0

    .line 22
    :cond_2
    sget p0, Ll/dbc0;->Kg:I

    .line 23
    .line 24
    return p0
.end method

.method public eb()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v0, "oDiamond"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/zxa;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/zxa;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public ec()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->P6:Ljava/util/Map;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public ef()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->X:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public em(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p3}, Ll/wyb0;->v0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p3, Ll/dxa;

    .line 13
    .line 14
    invoke-direct {p3, p2}, Ll/dxa;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, p1, p2, v0, p3}, Ll/wyb0;->A0(Lcom/p1/mobile/android/app/Act;ZZLkotlin/jvm/functions/Function1;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public fp()V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    const-string v2, "chatAppeal"

    .line 14
    .line 15
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;->Z1(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/PhoneNumber;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/high16 v0, 0x10000000

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public g4()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/t$a;->M()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public gc()V
    .locals 0

    .line 1
    invoke-static {}, Ll/tza0;->b()Ll/tza0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/tza0;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getAbHooker()Ll/m2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl;->a:Ll/m2;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAutoPlayVideoBs()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/lj1;->b()Ll/lj1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/lj1;->a()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBannersObs(Lcom/p1/mobile/putong/data/BannerLoc;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/BannerLoc;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Banners;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/mge;->n(Lcom/p1/mobile/putong/data/BannerLoc;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCurrencyProductCategory()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_LIVE_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wci0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getGPMemo(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getH5HeaderAuthorization()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/uwk;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xwa;->e(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMainWithNav(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMomentBannersView(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/widget/RelativeLayout;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/kec0;->wf:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    return-object p0
.end method

.method public getNewMainBundleBs(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ")",
            "Lrx/c<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/ji30;->g(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getNewMainLiveTabSelectBs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ji30;->j(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getNewMainMomentTabSelectBs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ji30;->j(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getNotifications()Lcom/p1/mobile/putong/data/UserPushSettings;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->R:Ll/gyd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 14
    .line 15
    return-object p0
.end method

.method public getSeeLastReadTime()J
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    return-wide v0
.end method

.method public getSessionChangedProfile()Ljava/lang/Integer;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->I7()Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSubscriptionsActClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTPayResultBs()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/bkj0<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/k;->v3()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qhk0$a;->a(Ll/qhk0;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getUserByIdInModule(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserSettings()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->J7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserSwipeCount()J
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->X:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    return-wide v0
.end method

.method public gi(Ljava/lang/String;Ljava/lang/String;ZILcom/p1/mobile/android/app/Act;IZLl/a30;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;
    .locals 0
    .param p4    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZI",
            "Lcom/p1/mobile/android/app/Act;",
            "IZ",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/google/android/material/bottomsheet/BottomSheetDialog;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/qp7;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p8}, Ll/qp7;-><init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/content/Context;IZLl/a30;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qp7;->f0()V

    .line 7
    .line 8
    .line 9
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p5}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/qp7;->show()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p0
.end method

.method public gp(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/epc0;->c(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public h5PayCanUseForLive()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/PaymentData;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/k;->w3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/tva0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public hideActiveTime(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ina;->w3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hideAge(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hideLocation(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hideTabBarWhenNewUIMomentIsCurrentTab(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i7(Ljava/lang/Boolean;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public hj(Ll/iam;Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    new-instance p0, Ll/zzm;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/zzm;-><init>(Ll/iam;Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Ll/z0n;->b(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->VIRTUAL_VOICE_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->LIVE_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public i0(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i0(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public i5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Lrx/c;
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->h2(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->k2()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public i7(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;I)Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->n5(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;I)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i8(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    invoke-static {p0, p2}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public i9()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o7a;->A3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public ie(Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    sget-object p4, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {p4, p3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Lcom/p1/mobile/putong/core/data/Message;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    move-object p0, p3

    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception p3

    .line 16
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    const/4 p4, 0x0

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p3, p2, p0, p4, v0}, Lcom/p1/mobile/putong/core/api/g;->En(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;Z)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p2, Ll/oxa;

    .line 30
    .line 31
    invoke-direct {p2, p1}, Ll/oxa;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public ii(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->momentId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, p2, p3, p4, p0}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->c2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->b2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public instanceofPersonalDetailsAct(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 2
    .line 3
    return p0
.end method

.method public isCurrentMessageBlock(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isCurrentTabMomentFrag(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public isHideRedByNewUser()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->X7()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public isHttpDnsOpen()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dkb;->ga()Lcom/p1/mobile/putong/core/data/RegionRule;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 34
    .line 35
    const-string v0, "LiveHijackHttpDNS"

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/RegionRuleTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/RegionRuleTag;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method public isLiveNeedDisableAudio(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/newmeet/NewMeetAct;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public isMainPage(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    return p0
.end method

.method public isMatched(Ljava/lang/String;)Lrx/c;
    .locals 0
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
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->wh(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public isMatchedSync(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->xh(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isNewMainActContext(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    return p0
.end method

.method public isPurchaseDialogShowing()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/nab0;->a()Ll/nab0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/nab0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ja()Ll/byd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->i:Ll/byd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public jc(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v11, 0x0

    .line 2
    const/4 v12, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x1

    .line 5
    const/4 v6, 0x0

    .line 6
    const-string v9, "pageId"

    .line 7
    .line 8
    const/4 v10, 0x0

    .line 9
    move-object v0, p1

    .line 10
    move-object v1, p2

    .line 11
    move/from16 v2, p3

    .line 12
    .line 13
    move-object/from16 v5, p4

    .line 14
    .line 15
    move-object/from16 v7, p5

    .line 16
    .line 17
    move-object/from16 v8, p6

    .line 18
    .line 19
    invoke-static/range {v0 .. v12}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public jg(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->s7(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public jp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->new_()Lcom/p1/mobile/putong/data/MomentFeedPushArgs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->uid:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p3, p0, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->mid:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->path:Ljava/lang/String;

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object p1, p1, Ll/dkb;->A0:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public k2()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/kxa;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/kxa;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public k4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public k7()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->l:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public k9(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ki(Landroid/app/Activity;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    const-string v2, "-1"

    .line 8
    .line 9
    invoke-interface {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public kj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public kk(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectStatusAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array v8, p0, [Z

    .line 3
    .line 4
    move-object v0, p1

    .line 5
    move-object v1, p2

    .line 6
    move v2, p3

    .line 7
    move-object v3, p4

    .line 8
    move-object v4, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v5, p7

    .line 11
    .line 12
    move-object/from16 v6, p8

    .line 13
    .line 14
    invoke-static/range {v0 .. v8}, Ll/j1a;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;[Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public ks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/g;->Le(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public kt()V
    .locals 0

    .line 1
    invoke-static {}, Ll/tza0;->b()Ll/tza0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/tza0;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public loadLikers(Lcom/p1/mobile/putong/data/Links;JI)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Links;",
            "JI)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Y6(Lcom/p1/mobile/putong/data/Links;JI)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public localiseMerchandises(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            "K:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "TK;>;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Merchandise;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/vxa;

    .line 12
    .line 13
    invoke-direct {p1, p3}, Ll/vxa;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public m2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public m8(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public ma(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p12}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->w2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public mc()Lcom/p1/mobile/putong/data/VisitorCounter;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->N4()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public me()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public me_()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public mediaPickerActArgs(Landroid/content/Context;IZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->d2(Landroid/content/Context;IZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public merchandises(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A5(Ljava/lang/String;Z)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/mxa;

    .line 10
    .line 11
    invoke-direct {p1, p3}, Ll/mxa;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public mergeNetworkStateIntoLocalState(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public ml(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/sh00;->h(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public mm(Lv/VImage;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget p0, Ll/dbc0;->r1:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p0, Ll/dbc0;->s1:I

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public momentSeeAbLikers()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->z7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public mq(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->new_()Lcom/p1/mobile/putong/core/data/MessageMomentGuide;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->ownerId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 8
    .line 9
    iput p3, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 10
    .line 11
    iput-wide p7, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->createdTime:D

    .line 12
    .line 13
    iput-object p4, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 14
    .line 15
    iput-object p5, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p6, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->audioDuration:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p9, p0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->videoDuration:Ljava/lang/String;

    .line 20
    .line 21
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->toJson()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/putong/core/api/g;->oh(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public n6(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/t600;->S(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public nd()Z
    .locals 0

    .line 1
    sget-boolean p0, Ll/m6i;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public newMainActClearStack(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 0

    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/c;->z3(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/c;->A3(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public newUIContainerAct(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "setting_scroll_to_bottom"

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public notificationSettings()Ll/gyd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->R:Ll/gyd0;

    .line 6
    .line 7
    return-object p0
.end method

.method public ns()I
    .locals 0

    .line 1
    sget p0, Ll/d79;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public od(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/t600;->I(Ljava/lang/String;)Ll/wzh0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/wzh0$a;->m()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/gxa;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/gxa;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public onCoinPay(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 4

    .line 1
    new-instance v0, Ll/do60;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_LIVE_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-static {v1}, Ll/wci0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v2}, Ll/do60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p2, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ll/do60;->h(Ljava/lang/String;)Ll/do60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v2, p2, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ll/do60;->l(I)Ll/do60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PaymentParamExtra;->purchaseEnv:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p2}, Ll/do60;->k(Ljava/lang/String;)Ll/do60;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Ll/do60;->a()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/PaymentParam;->setPurchaseTrackId(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/qeb0;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/qeb0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p2}, Ll/qeb0;->b(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Ll/qeb0;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;

    .line 80
    .line 81
    invoke-direct {v0, p0, p3, p5, p4}, Lcom/p1/mobile/putong/core/api/CoreServiceImpl$b;-><init>(Lcom/p1/mobile/putong/core/api/CoreServiceImpl;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;Ll/x20;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ll/qeb0;->c(Ll/bn50;)Ll/qeb0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/qeb0;->a()Ll/peb0;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v1}, Ll/wci0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-static {p1, p5, p2, p0}, Ll/a5i0;->B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/peb0;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public onlineMatchCaculaterBlur(I)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->z(I)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p7(Landroid/view/View;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 12
    .line 13
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->y(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public pa(Landroid/content/Context;ILcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/o7a;->y3(Landroid/content/Context;ILcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public patch(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public patchLiveSettings(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/UserLiveSettings;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dkb;->z9(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public patchSettings(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public pe()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public pm(Landroid/content/Context;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->a2(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pollConversation()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public pollUserCounters()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public pq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ps(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {v0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public purchase(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ll/wxa;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p5}, Ll/wxa;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public q7()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ROAMING_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q8()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/f760;->Companion:Ll/f760$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f760$a;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/a5i0;->A1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public qh(Landroid/view/View;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->getSelectStickerInfoOrMedia()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->s()V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public qp()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/m6i;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public queryMe()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->P9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public raw_messagePost(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    move-object p0, p2

    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception p2

    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/Message;->momentShowFromType:Ljava/lang/String;

    .line 20
    .line 21
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/data/Message;->isFromKanKan:Z

    .line 22
    .line 23
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Ro(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public refreshUser(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public refreshUser(Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/dkb;->X9(Ljava/lang/String;Z)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public registerPurchaseDialogListener(Ll/x3m;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/nab0;->a()Ll/nab0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nab0;->e(Ll/x3m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public removeUserFromLikers(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C7(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public removeUserFromSuggested(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public renderVipBadge(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public report(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Report;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X:Ll/pwa;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/moments/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/reports"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->w2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 51
    invoke-virtual {p0, p1, p3}, Ll/pwa;->h3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public report(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Report;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X:Ll/pwa;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "/"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, "/moments/"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, "/messages/"

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p1, "/reports"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->w2(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1, p4}, Ll/pwa;->h3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public resendDialog(Lcom/p1/mobile/android/app/Act;Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/p1/mobile/android/app/Act;",
            "TT;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->p1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public rg()Z
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qap$a;->x()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public rr()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    const-string v1, "hidden"

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    const-string v1, "RISK_TAG_UNREAL"

    .line 37
    .line 38
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_2
    return v0
.end method

.method public s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/xxa;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/xxa;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ll/yxa;

    .line 37
    .line 38
    invoke-direct {v0, p1, p2}, Ll/yxa;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public s2(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/e;->H6(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/ui7;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ui7;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/pxa;

    .line 30
    .line 31
    invoke-direct {v0, p1, p2}, Ll/pxa;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/qxa;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/qxa;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public se(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/j;->s5(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setIfShowTabBarInNewUI(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i7(Ljava/lang/Boolean;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setMomentTabDot(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->e7(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setMomentTabNum(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->k7(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setNewMainActClass(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->L5(Landroid/content/Context;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTabDot(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->e7(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabNum(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->k7(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public sg(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public shouldLockComment(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vb0;->g(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public shouldShowAutoPay()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public showAutoPayHelp(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fn(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public showBanner(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Banners;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/mge;->r(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Banners;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public showBindPhoneDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 6

    .line 1
    new-instance v2, Ll/uxa;

    .line 2
    .line 3
    invoke-direct {v2}, Ll/uxa;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const-string v1, ""

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    move-object v5, p2

    .line 12
    invoke-static/range {v0 .. v5}, Ll/qtk;->P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;ZZLl/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public showLocationPermissionCallbackDlg(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;ZZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Ll/c6w;->j(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public showMomentBanner()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "moment_feed"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/mge;->j(Lcom/p1/mobile/putong/data/BannerLoc;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/vb0;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {p1, p3, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-static {p2}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->h(Lcom/p1/mobile/putong/data/User;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 p2, -0x1

    .line 14
    if-ne p0, p2, :cond_0

    .line 15
    .line 16
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p3, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    sget p0, Ll/dbc0;->Du:I

    .line 37
    .line 38
    invoke-virtual {p3, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public showVipPurchaseDialog(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public skipH5PayActivityFromLive(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 4
    .line 5
    invoke-static {p2}, Lcom/p1/mobile/putong/core/api/k;->y3(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/k;->z3(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public sq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    move-object p0, p1

    .line 2
    move-object p1, p2

    .line 3
    new-instance p2, Ll/rxa;

    .line 4
    .line 5
    invoke-direct {p2, p3}, Ll/rxa;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    move-object p3, p4

    .line 9
    move-object p4, p5

    .line 10
    sget-object p5, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 11
    .line 12
    invoke-static/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public startJailedDialogLikeAct()V
    .locals 2

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x10000000

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public startLikersAct(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 0

    .line 6
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public startProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p11}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public te()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public tg()I
    .locals 2

    .line 1
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/yc2;->a()Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const-string v1, "idCard"

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    const/4 p0, 0x2

    .line 28
    return p0
.end method

.method public toBaiduMaps(Landroid/content/Context;I)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/map/MapAct;->a2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toIntlMaps(Landroid/content/Context;IZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/map/IntlMapAct;->h2(Landroid/content/Context;IZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toMessagesActFromPush(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p2, p0}, Ll/xwa;->n(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string p1, "bundle_notify_type"

    .line 7
    .line 8
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public toNewMainAct(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;
    .locals 0

    .line 6
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->T5(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toNewMainActFromPush(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Z6(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toPassWordResetAct(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toReportAct(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->b2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public trackBannerMV(Lcom/p1/mobile/putong/data/Banners;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/mge;->t(Lcom/p1/mobile/putong/data/Banners;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public trackPlayerBlockTime(JLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-lez p0, :cond_6

    .line 6
    .line 7
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/q4f;

    .line 25
    .line 26
    invoke-direct {p2}, Ll/q4f;-><init>()V

    .line 27
    .line 28
    .line 29
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 30
    .line 31
    iput-object v0, p2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 32
    .line 33
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const-string v1, "moments"

    .line 41
    .line 42
    const/4 v2, -0x1

    .line 43
    sparse-switch v0, :sswitch_data_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :sswitch_0
    const-string v0, "home_card"

    .line 48
    .line 49
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    if-nez p3, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v2, 0x3

    .line 57
    goto :goto_0

    .line 58
    :sswitch_1
    const-string v0, "from_nearby_focus"

    .line 59
    .line 60
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-nez p3, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const/4 v2, 0x2

    .line 68
    goto :goto_0

    .line 69
    :sswitch_2
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-nez p3, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    const/4 v2, 0x1

    .line 77
    goto :goto_0

    .line 78
    :sswitch_3
    const-string v0, "from_nearby_falls_feed"

    .line 79
    .line 80
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    if-nez p3, :cond_4

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    const/4 v2, 0x0

    .line 88
    :goto_0
    const-string p3, "e_VideoStuck_feed"

    .line 89
    .line 90
    packed-switch v2, :pswitch_data_0

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :pswitch_0
    const-string p3, "e_VideoStuck_profile"

    .line 95
    .line 96
    iput-object p3, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 97
    .line 98
    const-string p3, "p_suggest_user_profile_info_view"

    .line 99
    .line 100
    iput-object p3, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 101
    .line 102
    :goto_1
    const-string v1, ""

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :pswitch_1
    iput-object p3, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 106
    .line 107
    const-string p3, "p_follow"

    .line 108
    .line 109
    iput-object p3, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 110
    .line 111
    const-string v1, "follow"

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :pswitch_2
    iput-object p3, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 115
    .line 116
    const-string p3, "p_moment_fullscreen_view"

    .line 117
    .line 118
    iput-object p3, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :pswitch_3
    iput-object p3, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 122
    .line 123
    const-string p3, "p_nearby"

    .line 124
    .line 125
    iput-object p3, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 126
    .line 127
    const-string v1, "nearby"

    .line 128
    .line 129
    :goto_2
    const-string p3, "duration"

    .line 130
    .line 131
    invoke-interface {p0, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    const-string p1, "tag"

    .line 135
    .line 136
    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_5

    .line 144
    .line 145
    const-string p1, "url"

    .line 146
    .line 147
    invoke-interface {p0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    :cond_5
    iget-object p1, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-nez p1, :cond_6

    .line 157
    .line 158
    invoke-static {p2, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 159
    .line 160
    .line 161
    :cond_6
    :goto_3
    return-void

    .line 162
    nop

    .line 163
    :sswitch_data_0
    .sparse-switch
        0x13a81d90 -> :sswitch_3
        0x49a0be73 -> :sswitch_2
        0x4aa45d8d -> :sswitch_1
        0x7e397270 -> :sswitch_0
    .end sparse-switch

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public triggerCounterFromMemoryCache(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c;->E3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u7()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->s:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public u8()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/aw90;->e:Lrx/subjects/a;

    .line 6
    .line 7
    return-object p0
.end method

.method public uf(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 12
    .line 13
    const-string v1, "local_user_moment_message"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public unregisterPurchaseDialogListener(Ll/x3m;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/nab0;->a()Ll/nab0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nab0;->f(Ll/x3m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public up(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/gv20;->l(Lcom/p1/mobile/android/app/Act;Ll/y20;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public updateUnreadActivitiesByMoment(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c;->G3(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    return-void
.end method

.method public ur(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/j1a;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public userObsById(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public userStoryAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/webview/UserStoryAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ut()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->m3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZ",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array v11, p0, [Z

    .line 3
    .line 4
    const/4 v10, 0x0

    .line 5
    move-object v0, p1

    .line 6
    move-object v1, p2

    .line 7
    move v2, p3

    .line 8
    move/from16 v3, p4

    .line 9
    .line 10
    move-object/from16 v4, p5

    .line 11
    .line 12
    move-object/from16 v5, p6

    .line 13
    .line 14
    move-object/from16 v8, p7

    .line 15
    .line 16
    move-object/from16 v9, p8

    .line 17
    .line 18
    move-object/from16 v6, p9

    .line 19
    .line 20
    move-object/from16 v7, p10

    .line 21
    .line 22
    invoke-static/range {v0 .. v11}, Ll/j1a;->B(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Z[Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public verifyAppealIdentity(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PhoneNumber;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/yc2;->a()Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p2}, Ll/hxf;->o(Lcom/p1/mobile/putong/data/PhoneNumber;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    const-string p2, "idCard"

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    const-string v0, "appeal"

    .line 27
    .line 28
    if-nez p2, :cond_2

    .line 29
    .line 30
    const-string p2, "picture"

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    invoke-static {p1, v0}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;->Y1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public vn(Lcom/p1/mobile/putong/data/User;)J
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    return-wide p0

    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getActiveTimeFromSvip()J

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    return-wide p0
.end method

.method public vq()Lcom/p1/mobile/putong/data/IntlOperationArticles;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h1:Ll/o7a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o7a;->B3()Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public w7(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xwa;->d(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w8(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public waitPatchSettings()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const-string v0, "settings"

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->wait(Ljava/lang/String;I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public wb()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v0, "svip"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/fxa;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/fxa;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public xf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/wci0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public xs(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public yd(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/i25;->g(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public yf(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move-object v5, p5

    .line 10
    move-object v6, p6

    .line 11
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->Hp(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public yo(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;ZLandroid/view/View;)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/newui/view/MessageInputEditView;",
            "Z",
            "Landroid/view/View;",
            ")",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p5, :cond_0

    .line 3
    .line 4
    sget p5, Ll/kec0;->z8:I

    .line 5
    .line 6
    invoke-static {p1, p5, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    .line 11
    .line 12
    move-object p5, p4

    .line 13
    move-object p4, p3

    .line 14
    move-object p3, p2

    .line 15
    move-object p2, p1

    .line 16
    move-object p1, p0

    .line 17
    invoke-virtual/range {p1 .. p6}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->B(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_0
    move-object p5, p4

    .line 22
    move-object p4, p3

    .line 23
    move-object p3, p2

    .line 24
    move-object p2, p1

    .line 25
    sget p1, Ll/kec0;->H7:I

    .line 26
    .line 27
    invoke-static {p2, p1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->s(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;)V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public yp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZLjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p12}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->v2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public yr()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z8(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/i25;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public ze(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public zp(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->l6(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method
