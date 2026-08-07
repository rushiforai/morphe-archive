.class public Ll/xg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String;

.field public static b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "http://m.staging2.p1staff.com"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "https://m.tantanapp.com"

    .line 11
    .line 12
    :goto_0
    const-string v1, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/ai-draw/index.html?speed=true&_bid=1004194&hideNotch=1&hideNavigationBar=1#/"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/xg0;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Ll/xg0;->b:Lrx/subjects/a;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    new-instance v1, Ll/xg0$a;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/xg0$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 23
    .line 24
    const-string v1, "female"

    .line 25
    .line 26
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    const-string p0, "\u5979"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p0, "\u4ed6"

    .line 36
    .line 37
    :goto_0
    const-string v1, "%s\u6ca1\u6709\u53ef\u7528\u7684\u5934\u50cf\u7167\u7247\uff0c\u63d0\u9192%s\u4e0a\u4f20\u4e94\u5b98\u6e05\u6670\u7684\u7167\u7247\u5427~"

    .line 38
    .line 39
    filled-new-array {p0, p0}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    xor-int/lit8 p0, p0, 0x1

    .line 55
    .line 56
    return p0
.end method

.method public static b(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 29
    .line 30
    const-string p0, "image/*"

    .line 31
    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 33
    .line 34
    const-string p0, "raw"

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v1, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    const-string v0, "\u56fe\u7247"

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 59
    .line 60
    const-string v0, "ai_picture"

    .line 61
    .line 62
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiPictureMsgData;->new_()Lcom/p1/mobile/putong/core/data/AiPictureMsgData;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/AiPictureMsgData;->momoImgUrl:Ljava/lang/String;

    .line 73
    .line 74
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/AiPictureMsgData;->taskId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/AiPictureMsgData;->toJson()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 84
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {p1}, Ll/xg0;->a(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/xg0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "from"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 21
    .line 22
    .line 23
    const-string p2, "userId"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 28
    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string p2, "gender"

    .line 37
    .line 38
    invoke-virtual {v0, p2, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const/4 v5, 0x1

    .line 46
    const/4 v6, 0x0

    .line 47
    const-string v2, ""

    .line 48
    .line 49
    const/4 v4, 0x1

    .line 50
    move-object v1, p0

    .line 51
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "hideNotch"

    .line 56
    .line 57
    const/4 p2, 0x1

    .line 58
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "default"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 16
    .line 17
    const-string v2, "dismissed"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 26
    .line 27
    const-string v1, "blocked"

    .line 28
    .line 29
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v0
.end method

.method public static e(Lcom/p1/mobile/putong/data/User;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 14
    .line 15
    const-string v2, "hidden"

    .line 16
    .line 17
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 28
    .line 29
    const-string v2, "RISK_TAG_UNREAL"

    .line 30
    .line 31
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 42
    .line 43
    const-string v2, "RISK_TAG_FAKE_BATCH_STATUS"

    .line 44
    .line 45
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_2

    .line 67
    .line 68
    const/4 p0, 0x1

    .line 69
    return p0

    .line 70
    :cond_2
    :goto_0
    return v0
.end method
