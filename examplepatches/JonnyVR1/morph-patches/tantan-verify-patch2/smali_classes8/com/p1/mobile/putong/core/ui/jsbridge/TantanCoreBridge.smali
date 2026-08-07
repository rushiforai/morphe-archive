.class public Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;
.super Ll/wc00;
.source "SourceFile"


# static fields
.field public static h:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;",
            ">;"
        }
    .end annotation
.end field

.field public static i:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->h:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->i:Lrx/subjects/b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wc00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L(Ljava/io/File;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

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

.method public static synthetic O(Ll/xc00;Ljava/lang/String;)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string p0, "unknown_"

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    const/4 v11, 0x1

    .line 30
    const/4 v12, 0x0

    .line 31
    const-string v4, "from_questions_answers"

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    const/4 v6, 0x1

    .line 35
    const/4 v7, 0x0

    .line 36
    const/16 v9, 0x111

    .line 37
    .line 38
    const/4 v10, 0x0

    .line 39
    move-object v13, p1

    .line 40
    invoke-interface/range {v1 .. v13}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->yp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic P(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lrx/c;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "\u9001\u4f60\u4e00\u5f20\u9b54\u6cd5\u7167\uff0c\u6211\u6700\u559c\u6b22\u8fd9\u5f20"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "\u98ce\u683c\u7684\u4f60\uff01"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 25
    .line 26
    const-string p0, "text"

    .line 27
    .line 28
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v3, 0x0

    .line 41
    move-object v1, p1

    .line 42
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance p1, Ll/tbi0;

    .line 47
    .line 48
    invoke-direct {p1, p2}, Ll/tbi0;-><init>(Ljava/io/File;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    :goto_0
    move-object v1, p1

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const-string p1, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x0

    .line 18
    move-object v0, p0

    .line 19
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->z0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/data/Conversation;)Landroid/util/Pair;
    .locals 2

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic S(Ll/xc00;Ljava/lang/String;Ll/vg60;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    filled-new-array {p2}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    :catch_0
    :cond_0
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic U([Ll/w30;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_user_profile_more_popup_cancel"

    .line 2
    .line 3
    const-string v0, "p_user_profile_more_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    aget-object v0, p0, p1

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic V(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string p0, "unknown_"

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    const/4 v10, 0x1

    .line 20
    const/4 v11, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    const/16 v8, 0x111

    .line 25
    .line 26
    const/4 v9, 0x0

    .line 27
    move-object v2, p1

    .line 28
    move-object v3, p2

    .line 29
    invoke-interface/range {v0 .. v11}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic W(Ll/xc00;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "profile"

    .line 10
    .line 11
    invoke-static {v2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "from_card_upload_photo"

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/we60;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic X(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 5

    .line 1
    const-string v0, "questionnaires"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "answers"

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "identifier"

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "successFn"

    .line 20
    .line 21
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 46
    .line 47
    const/4 v4, 0x1

    .line 48
    invoke-virtual {v3, v2, v4, v0}, Ll/uab;->d3(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/vbi0;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/vbi0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/r47;

    .line 67
    .line 68
    invoke-direct {v1}, Ll/r47;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/wbi0;

    .line 76
    .line 77
    invoke-direct {v1, p1, p0}, Ll/wbi0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    new-instance p0, Ll/xbi0;

    .line 81
    .line 82
    invoke-direct {p0}, Ll/xbi0;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->Z0(Ljava/lang/String;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic Z(Ll/xc00;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xc00;->e()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 14
    .line 15
    .line 16
    :goto_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public static synthetic a0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->S0(Ll/xc00;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic d0(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Ll/gra;->z()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "1"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "0"

    .line 21
    .line 22
    :goto_0
    filled-new-array {v0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {p1, p0, v0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->X0(Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->W0(Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->V0(Ljava/lang/String;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/data/OMSThemeInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->M5()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "\u7f51\u7edc\u4e0d\u7ed9\u529b\uff0c\u7a0d\u540e\u518d\u8bd5\u5427"

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->Q0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic k0(Lorg/json/JSONObject;Ll/xc00;Ljava/util/List;)V
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x3

    .line 17
    if-le v1, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    :goto_0
    const/4 v1, 0x0

    .line 25
    :goto_1
    if-ge v1, v2, :cond_2

    .line 26
    .line 27
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 48
    .line 49
    .line 50
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    const-string p2, "callback"

    .line 54
    .line 55
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-nez p2, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string v0, "\""

    .line 74
    .line 75
    const-string v1, "\\\""

    .line 76
    .line 77
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    filled-new-array {p2}, [Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-interface {p1, p0, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->Y0()V

    return-void
.end method

.method public static synthetic m0(Ll/xc00;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/aci0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/aci0;-><init>(Ll/xc00;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/bci0;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/bci0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic n0(Ll/xc00;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Ljava/lang/String;Landroid/graphics/Bitmap;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->U0(Ll/xc00;Ljava/lang/String;Landroid/graphics/Bitmap;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p0(Ljava/io/File;)Lrx/c;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/dci0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/dci0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic q0(Ll/gcg0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/data/User;)V
    .locals 14

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v8, Ll/qbi0;

    .line 8
    .line 9
    invoke-direct {v8}, Ll/qbi0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v9, Ll/sbi0;

    .line 13
    .line 14
    invoke-direct {v9}, Ll/sbi0;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v12, 0x0

    .line 18
    const/4 v13, 0x0

    .line 19
    const/4 v3, 0x1

    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v5, 0x0

    .line 22
    const-string v6, "logout_ab"

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    const-string v10, "p_delete_account_chat_block"

    .line 26
    .line 27
    const/4 v11, 0x0

    .line 28
    move-object v1, p0

    .line 29
    move-object v2, p1

    .line 30
    invoke-static/range {v1 .. v13}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Lorg/json/JSONObject;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->R0(Ll/xc00;Lorg/json/JSONObject;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->T0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v0(Ll/xc00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/cfx;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final A0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final B0(Ll/xc00;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "false"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->x0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "callback"

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {}, Ll/h39;->g()Lcom/p1/mobile/putong/core/data/AiPictureConfig;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->B0(Ll/xc00;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget v0, v0, Lcom/p1/mobile/putong/core/data/AiPictureConfig;->timeout:I

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->o1(Ll/xc00;Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    :cond_2
    :goto_0
    return-void
.end method

.method public final D0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->ng()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/fbi0;

    .line 23
    .line 24
    invoke-direct {v0, p2, p1}, Ll/fbi0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ll/hbi0;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/hbi0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public E0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, Ll/wai0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/wai0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    return-void
.end method

.method public final F0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    const-string v0, ""

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    :try_start_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 52
    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    iget-object v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_0

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->userShareTip()Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_0

    .line 80
    .line 81
    iget-object p0, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    move-object p0, v0

    .line 85
    :goto_0
    const-string v1, "callback"

    .line 86
    .line 87
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_2

    .line 106
    .line 107
    move-object v0, p0

    .line 108
    :cond_2
    filled-new-array {v0}, [Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-interface {p1, p2, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 113
    .line 114
    .line 115
    :catch_0
    :cond_3
    return-void
.end method

.method public final G0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "callback"

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "current_session_id"

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v1, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 42
    .line 43
    invoke-virtual {v2, p2}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const/4 v3, 0x1

    .line 48
    invoke-virtual {v2, v3}, Lrx/c;->take(I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    new-instance v3, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$a;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$a;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ll/dbi0;

    .line 66
    .line 67
    invoke-direct {v2, p0, p1, v0, p2}, Ll/dbi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    return-void
.end method

.method public final H0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookUnMatchAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final I0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    const/high16 p0, 0x42560000    # 53.5f

    .line 4
    .line 5
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    neg-int v1, p0

    .line 10
    sget v3, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->o:I

    .line 11
    .line 12
    new-instance v4, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v5, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, ""

    .line 23
    .line 24
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->c2(Landroid/content/Context;ILjava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final J0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    new-instance v0, Ll/ebi0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/ebi0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final K0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zai0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/zai0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    :try_start_0
    const-string p0, "inputType"

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string p2, "photo"

    .line 18
    .line 19
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    new-instance p0, Ll/rbi0;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Ll/rbi0;-><init>(Ll/xc00;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    new-instance p2, Ll/cci0;

    .line 35
    .line 36
    invoke-direct {p2, p1, p0}, Ll/cci0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :goto_0
    return-void
.end method

.method public final M0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_CP:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopFragAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final N0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "profile_user_id"

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "purchaseShowFrom"

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "channel"

    .line 25
    .line 26
    const-string v2, ""

    .line 27
    .line 28
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v1, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 40
    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 44
    .line 45
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    new-instance v3, Ll/xai0;

    .line 50
    .line 51
    invoke-direct {v3}, Ll/xai0;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x1

    .line 63
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Ll/yai0;

    .line 68
    .line 69
    invoke-direct {v2, p0, p1, v0, p2}, Ll/yai0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_0
    return-void
.end method

.method public final O0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    const-string p0, "userId"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "from"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "pet"

    .line 14
    .line 15
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string p2, "form_my_pet"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, "share_profile"

    .line 25
    .line 26
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    move-object p2, v0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string p2, "from_questions_answers"

    .line 35
    .line 36
    :goto_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->userObsById(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/eci0;

    .line 58
    .line 59
    invoke-direct {v1, p1, p0, p2}, Ll/eci0;-><init>(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public P0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/iz40;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V
    .locals 3

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p3, p4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iget-object v0, p4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object p4, p4, Ll/bkj0;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p4, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    iget-object v1, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_0

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatMMAndUserInfo;->new_()Lcom/p1/mobile/putong/core/data/ChatMMAndUserInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 58
    .line 59
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 60
    .line 61
    iput-object p3, v1, Lcom/p1/mobile/putong/core/data/ChatMMAndUserInfo;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 62
    .line 63
    iget-object p3, v1, Lcom/p1/mobile/putong/core/data/ChatMMAndUserInfo;->userInformation:Lcom/p1/mobile/putong/core/data/ChatMMUserInfo;

    .line 64
    .line 65
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v2, p3, Lcom/p1/mobile/putong/core/data/ChatMMUserInfo;->userId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile128()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p3, Lcom/p1/mobile/putong/core/data/ChatMMUserInfo;->userPicture:Ljava/lang/String;

    .line 82
    .line 83
    iget-object p3, v1, Lcom/p1/mobile/putong/core/data/ChatMMAndUserInfo;->userInformation:Lcom/p1/mobile/putong/core/data/ChatMMUserInfo;

    .line 84
    .line 85
    iget-object v0, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    iput-object v0, p3, Lcom/p1/mobile/putong/core/data/ChatMMUserInfo;->otherUserId:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 90
    .line 91
    .line 92
    move-result-object p4

    .line 93
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profile128()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p4

    .line 101
    iput-object p4, p3, Lcom/p1/mobile/putong/core/data/ChatMMUserInfo;->otherUserPicture:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatMMAndUserInfo;->toJson()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->p1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->B0(Ll/xc00;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->B0(Ll/xc00;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    new-instance p0, Ljava/lang/NullPointerException;

    .line 119
    .line 120
    new-instance p1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string p2, "local conversation disappearance userId = "

    .line 123
    .line 124
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final synthetic R0(Ll/xc00;Lorg/json/JSONObject;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p4, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 8
    .line 9
    invoke-virtual {p5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object p5

    .line 13
    sget p6, Lcom/p1/mobile/putong/core/R$string;->r:I

    .line 14
    .line 15
    invoke-virtual {p5, p6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p5

    .line 19
    invoke-static {p4, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    if-eqz p4, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->k1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    aget-object p1, p3, p0

    .line 30
    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    aget-object p0, p3, p0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final synthetic S0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ll/w30;

    .line 3
    .line 4
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget v3, Lcom/p1/mobile/putong/core/R$string;->r:I

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    filled-new-array {v2}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    sget v4, Ll/c9c0;->L:I

    .line 30
    .line 31
    filled-new-array {v4}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const-class v5, Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const-string v6, "p_user_profile_more_popup"

    .line 42
    .line 43
    invoke-static {v6, v5}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-static {v5}, Ll/w1e;->f(Ll/l4g0;)V

    .line 48
    .line 49
    .line 50
    new-instance v6, Ll/w30$b;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    invoke-direct {v6, v7}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    new-instance v7, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$b;

    .line 60
    .line 61
    invoke-direct {v7, p0, v5}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$b;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/l4g0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v6, v7}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 69
    .line 70
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    sget v8, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 75
    .line 76
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    invoke-virtual {v5, v7}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    new-instance v7, Ll/ybi0;

    .line 85
    .line 86
    invoke-direct {v7, v0}, Ll/ybi0;-><init>([Ll/w30;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v5, v7}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-virtual {v5, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1, v3, v4}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    new-instance v3, Ll/zbi0;

    .line 102
    .line 103
    invoke-direct {v3, p0, p1, p2, v0}, Ll/zbi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Lorg/json/JSONObject;[Ll/w30;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1, v3}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6}, Ll/w30$b;->F()Ll/w30;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    aput-object p0, v0, v2

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final synthetic T0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p4, p1}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-static {p0, p1, p2, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance p4, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 27
    .line 28
    const-string v0, "from_core_bridge"

    .line 29
    .line 30
    invoke-direct {p4, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p4, p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-static {}, Ll/s7a;->z()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    const-string p1, "seekPartnerNum"

    .line 49
    .line 50
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 65
    .line 66
    const-string p1, "from_find_partner"

    .line 67
    .line 68
    invoke-virtual {p4, p1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 72
    .line 73
    invoke-static {p0, p4}, Lcom/p1/mobile/putong/core/ui/greet/d;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p3}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 92
    .line 93
    :cond_3
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 94
    .line 95
    invoke-static {p0, p4}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic U0(Ll/xc00;Ljava/lang/String;Landroid/graphics/Bitmap;)Ljava/io/File;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->B0(Ll/xc00;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-string p0, "jpg"

    .line 9
    .line 10
    invoke-static {p0}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :try_start_0
    new-instance p1, Ljava/io/FileOutputStream;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    .line 18
    .line 19
    :try_start_1
    sget-object p2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 20
    .line 21
    const/16 v1, 0x64

    .line 22
    .line 23
    invoke-virtual {p3, p2, v1, p1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    move-object v0, p1

    .line 32
    goto :goto_0

    .line 33
    :catchall_1
    move-exception p0

    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-object p1, v0

    .line 36
    goto :goto_1

    .line 37
    :goto_0
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :catch_1
    :goto_1
    invoke-static {p1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method public final synthetic V0(Ljava/lang/String;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p6, p1, p2}, Ll/xg0;->b(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->B0(Ll/xc00;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    const/4 p4, 0x0

    .line 15
    move-object p1, p5

    .line 16
    const/4 p5, 0x0

    .line 17
    const/4 p3, 0x0

    .line 18
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/ubi0;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/ubi0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final synthetic W0(Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->p1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ll/xg0;->b:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0, p4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic X0(Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->B0(Ll/xc00;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Y0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    const-string v1, "p_receive_pick,unlock"

    .line 12
    .line 13
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic Z0(Ljava/lang/String;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 14
    .line 15
    const-string v0, "deleted"

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-static {p0, p1, p2, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    new-instance p0, Ljava/lang/NullPointerException;

    .line 42
    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v0, "local conversation disappearance userId = "

    .line 46
    .line 47
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final a1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "otherId"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    filled-new-array {p0}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H8(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    :goto_0
    return-void
.end method

.method public final b1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "otherId"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    new-instance p2, Ll/vai0;

    .line 20
    .line 21
    invoke-direct {p2, p1, p0}, Ll/vai0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    :goto_0
    return-void
.end method

.method public c1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    new-instance p0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-wide/16 p1, 0x0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const-string v1, "feedback"

    .line 14
    .line 15
    invoke-static {p0, v1, p1, p2, v0}, Ll/qu2;->E(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final e1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    new-instance v0, Ll/abi0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/abi0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final f1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    const-string p0, "featureID"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p2, -0x1

    .line 26
    invoke-virtual {p0, p2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final g1()V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/v4j0;->i(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    const-string v0, "success"

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const-string p0, "true"

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const-string p0, "false"

    .line 28
    .line 29
    :goto_1
    filled-new-array {p0}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p1, p2, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    :catch_0
    return-void
.end method

.method public final i1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->e()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/xc00;->e()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p2, Ll/gbi0;

    .line 17
    .line 18
    invoke-direct {p2, p1}, Ll/gbi0;-><init>(Ll/xc00;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public j1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 20
    .line 21
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final k1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "receive_report_user_id"

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;-><init>()V

    .line 28
    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/ReportFrom;->IDENTIFY_FAKE:Lcom/p1/mobile/putong/core/data/ReportFrom;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportFrom:Lcom/p1/mobile/putong/core/data/ReportFrom;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v1, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$3;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-direct {v1, p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$3;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Landroid/os/Handler;Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    invoke-static {p1, p2, p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->c2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_0
    return-void
.end method

.method public l1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    const-string v0, "userId"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    const-string v0, "picture"

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v0, "callback"

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    const-string v0, "taskId"

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const-string v0, "styleName"

    .line 32
    .line 33
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 44
    .line 45
    .line 46
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Ll/jbi0;

    .line 53
    .line 54
    invoke-direct {v2, p0, p1, v5}, Ll/jbi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ll/kbi0;

    .line 62
    .line 63
    invoke-direct {v2}, Ll/kbi0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Ll/lbi0;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/lbi0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ll/mbi0;

    .line 80
    .line 81
    invoke-direct {v2, p2, v6}, Ll/mbi0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    new-instance v1, Ll/nbi0;

    .line 89
    .line 90
    move-object v2, p0

    .line 91
    move-object v7, v6

    .line 92
    move-object v6, v5

    .line 93
    move-object v5, p1

    .line 94
    invoke-direct/range {v1 .. v7}, Ll/nbi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    move-object v4, v5

    .line 98
    move-object v5, v6

    .line 99
    move-object v6, v7

    .line 100
    invoke-virtual {p2, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v1, Ll/obi0;

    .line 109
    .line 110
    move-object v3, v0

    .line 111
    invoke-direct/range {v1 .. v6}, Ll/obi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    new-instance p1, Ll/pbi0;

    .line 115
    .line 116
    invoke-direct {p1, v2, v3, v4, v5}, Ll/pbi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Lcom/p1/mobile/putong/app/PutongAct;Ll/xc00;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    :cond_1
    :goto_0
    return-void
.end method

.method public m1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ll/fci0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/fci0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n1()V
    .locals 1

    .line 1
    new-instance v0, Ll/ibi0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ibi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o1(Ll/xc00;Ljava/lang/String;I)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "true"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "data"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p3

    .line 20
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->x0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final p1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "true"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const-string v1, "data"

    .line 20
    .line 21
    new-instance v2, Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception p3

    .line 31
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->x0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final q1(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    const-string v0, "uid"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/bbi0;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/bbi0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/cbi0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/cbi0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public r1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "purchaseShowFrom"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/jci0;

    .line 17
    .line 18
    invoke-direct {p2, p1, p0}, Ll/jci0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public final s1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "callback"

    .line 13
    .line 14
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->vn()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    new-instance v0, Ll/hci0;

    .line 47
    .line 48
    invoke-direct {v0, p1, p0}, Ll/hci0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/ici0;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/ici0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_0
    return-void
.end method

.method public v(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p2, "refreshPrivileges"

    .line 17
    .line 18
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v2, 0x22

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p2, "sendAiPictureMessage"

    .line 31
    .line 32
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v2, 0x21

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p2, "monitor"

    .line 45
    .line 46
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v2, 0x20

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p2, "jumpToProfileAct"

    .line 59
    .line 60
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-nez p2, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v2, 0x1f

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p2, "jumpToGreetOrChat"

    .line 73
    .line 74
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-nez p2, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v2, 0x1e

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p2, "setShowThemeCard"

    .line 87
    .line 88
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-nez p2, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v2, 0x1d

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p2, "pickedCardInfo"

    .line 101
    .line 102
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-nez p2, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v2, 0x1c

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p2, "addRecommendationsWidget"

    .line 115
    .line 116
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-nez p2, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v2, 0x1b

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p2, "knockWoodenFishSound"

    .line 129
    .line 130
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-nez p2, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v2, 0x1a

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p2, "getSelectedNewUI"

    .line 143
    .line 144
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    if-nez p2, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v2, 0x19

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p2, "hasUserCanPick"

    .line 157
    .line 158
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    if-nez p2, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v2, 0x18

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p2, "jumToReport"

    .line 171
    .line 172
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-nez p2, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v2, 0x17

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p2, "toNativeMessagePage"

    .line 185
    .line 186
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-nez p2, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v2, 0x16

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p2, "requestDisallowAndroidTouchEvent"

    .line 199
    .line 200
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    if-nez p2, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v2, 0x15

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p2, "getSparkPartnerData"

    .line 213
    .line 214
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p2

    .line 218
    if-nez p2, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v2, 0x14

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p2, "likeSuccess"

    .line 227
    .line 228
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result p2

    .line 232
    if-nez p2, :cond_f

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v2, 0x13

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p2, "clockinShown"

    .line 241
    .line 242
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    if-nez p2, :cond_10

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v2, 0x12

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p2, "totalDismissedMatchCount"

    .line 255
    .line 256
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result p2

    .line 260
    if-nez p2, :cond_11

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v2, 0x11

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p2, "getShareUserId"

    .line 269
    .line 270
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p2

    .line 274
    if-nez p2, :cond_12

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v2, 0x10

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p2, "matchSuccess"

    .line 283
    .line 284
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result p2

    .line 288
    if-nez p2, :cond_13

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_13
    const/16 v2, 0xf

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p2, "jumpToPush"

    .line 297
    .line 298
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result p2

    .line 302
    if-nez p2, :cond_14

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_14
    const/16 v2, 0xe

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p2, "nothingUserCanPick"

    .line 311
    .line 312
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result p2

    .line 316
    if-nez p2, :cond_15

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_15
    const/16 v2, 0xd

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p2, "pushState"

    .line 325
    .line 326
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result p2

    .line 330
    if-nez p2, :cond_16

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :cond_16
    const/16 v2, 0xc

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p2, "monitorContent"

    .line 339
    .line 340
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result p2

    .line 344
    if-nez p2, :cond_17

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_17
    const/16 v2, 0xb

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p2, "showSeeDialog"

    .line 353
    .line 354
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result p2

    .line 358
    if-nez p2, :cond_18

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :cond_18
    const/16 v2, 0xa

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p2, "jumpToEditProfileAct"

    .line 367
    .line 368
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result p2

    .line 372
    if-nez p2, :cond_19

    .line 373
    .line 374
    goto/16 :goto_0

    .line 375
    .line 376
    :cond_19
    const/16 v2, 0x9

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p2, "openChatHeatFeature"

    .line 381
    .line 382
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result p2

    .line 386
    if-nez p2, :cond_1a

    .line 387
    .line 388
    goto/16 :goto_0

    .line 389
    .line 390
    :cond_1a
    const/16 v2, 0x8

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p2, "dailyReportJumpWebview"

    .line 395
    .line 396
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result p2

    .line 400
    if-nez p2, :cond_1b

    .line 401
    .line 402
    goto :goto_0

    .line 403
    :cond_1b
    const/4 v2, 0x7

    .line 404
    goto :goto_0

    .line 405
    :sswitch_1c
    const-string p2, "toSVIPDialog"

    .line 406
    .line 407
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result p2

    .line 411
    if-nez p2, :cond_1c

    .line 412
    .line 413
    goto :goto_0

    .line 414
    :cond_1c
    const/4 v2, 0x6

    .line 415
    goto :goto_0

    .line 416
    :sswitch_1d
    const-string p2, "jumpToGameCp"

    .line 417
    .line 418
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 419
    .line 420
    .line 421
    move-result p2

    .line 422
    if-nez p2, :cond_1d

    .line 423
    .line 424
    goto :goto_0

    .line 425
    :cond_1d
    const/4 v2, 0x5

    .line 426
    goto :goto_0

    .line 427
    :sswitch_1e
    const-string p2, "editFakeAvatar"

    .line 428
    .line 429
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result p2

    .line 433
    if-nez p2, :cond_1e

    .line 434
    .line 435
    goto :goto_0

    .line 436
    :cond_1e
    const/4 v2, 0x4

    .line 437
    goto :goto_0

    .line 438
    :sswitch_1f
    const-string p2, "goNativeSearchPage"

    .line 439
    .line 440
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 441
    .line 442
    .line 443
    move-result p2

    .line 444
    if-nez p2, :cond_1f

    .line 445
    .line 446
    goto :goto_0

    .line 447
    :cond_1f
    const/4 v2, 0x3

    .line 448
    goto :goto_0

    .line 449
    :sswitch_20
    const-string p2, "getAiPictureTimeout"

    .line 450
    .line 451
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result p2

    .line 455
    if-nez p2, :cond_20

    .line 456
    .line 457
    goto :goto_0

    .line 458
    :cond_20
    const/4 v2, 0x2

    .line 459
    goto :goto_0

    .line 460
    :sswitch_21
    const-string p2, "recommendedUsers"

    .line 461
    .line 462
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result p2

    .line 466
    if-nez p2, :cond_21

    .line 467
    .line 468
    goto :goto_0

    .line 469
    :cond_21
    move v2, v1

    .line 470
    goto :goto_0

    .line 471
    :sswitch_22
    const-string p2, "goNativeDeleteMatchedPage"

    .line 472
    .line 473
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result p2

    .line 477
    if-nez p2, :cond_22

    .line 478
    .line 479
    goto :goto_0

    .line 480
    :cond_22
    move v2, v0

    .line 481
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 482
    .line 483
    .line 484
    return v0

    .line 485
    :pswitch_0
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->j1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 486
    .line 487
    .line 488
    return v1

    .line 489
    :pswitch_1
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->l1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 490
    .line 491
    .line 492
    return v1

    .line 493
    :pswitch_2
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->c1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 494
    .line 495
    .line 496
    return v1

    .line 497
    :pswitch_3
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->O0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 498
    .line 499
    .line 500
    return v1

    .line 501
    :pswitch_4
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->N0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 502
    .line 503
    .line 504
    return v1

    .line 505
    :pswitch_5
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->m1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 506
    .line 507
    .line 508
    return v1

    .line 509
    :pswitch_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->g1()V

    .line 510
    .line 511
    .line 512
    return v1

    .line 513
    :pswitch_7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->w0(Ll/xc00;)V

    .line 514
    .line 515
    .line 516
    return v1

    .line 517
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 518
    .line 519
    const-string p1, "vibrator"

    .line 520
    .line 521
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 522
    .line 523
    .line 524
    move-result-object p0

    .line 525
    check-cast p0, Landroid/os/Vibrator;

    .line 526
    .line 527
    const-wide/16 p1, 0x32

    .line 528
    .line 529
    invoke-virtual {p0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 530
    .line 531
    .line 532
    invoke-static {}, Ll/rv4;->h()V

    .line 533
    .line 534
    .line 535
    return v1

    .line 536
    :pswitch_9
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->E0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 537
    .line 538
    .line 539
    return v1

    .line 540
    :pswitch_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->J0()V

    .line 541
    .line 542
    .line 543
    return v1

    .line 544
    :pswitch_b
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->K0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 545
    .line 546
    .line 547
    return v1

    .line 548
    :pswitch_c
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->q1(Lorg/json/JSONObject;)V

    .line 549
    .line 550
    .line 551
    return v1

    .line 552
    :pswitch_d
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->i1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 553
    .line 554
    .line 555
    return v1

    .line 556
    :pswitch_e
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->G0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 557
    .line 558
    .line 559
    return v1

    .line 560
    :pswitch_f
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->a1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 561
    .line 562
    .line 563
    return v1

    .line 564
    :pswitch_10
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->y0(Lorg/json/JSONObject;)V

    .line 565
    .line 566
    .line 567
    return v1

    .line 568
    :pswitch_11
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->s1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 569
    .line 570
    .line 571
    return v1

    .line 572
    :pswitch_12
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->F0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 573
    .line 574
    .line 575
    return v1

    .line 576
    :pswitch_13
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->b1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 577
    .line 578
    .line 579
    return v1

    .line 580
    :pswitch_14
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->P0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 581
    .line 582
    .line 583
    return v1

    .line 584
    :pswitch_15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->e1()V

    .line 585
    .line 586
    .line 587
    return v1

    .line 588
    :pswitch_16
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->h1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 589
    .line 590
    .line 591
    return v1

    .line 592
    :pswitch_17
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->d1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 593
    .line 594
    .line 595
    return v1

    .line 596
    :pswitch_18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->n1()V

    .line 597
    .line 598
    .line 599
    return v1

    .line 600
    :pswitch_19
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->L0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 601
    .line 602
    .line 603
    return v1

    .line 604
    :pswitch_1a
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->f1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 605
    .line 606
    .line 607
    return v1

    .line 608
    :pswitch_1b
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->z0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 609
    .line 610
    .line 611
    return v1

    .line 612
    :pswitch_1c
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->r1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 613
    .line 614
    .line 615
    return v1

    .line 616
    :pswitch_1d
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->M0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 617
    .line 618
    .line 619
    return v1

    .line 620
    :pswitch_1e
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->A0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 621
    .line 622
    .line 623
    return v1

    .line 624
    :pswitch_1f
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->I0()V

    .line 625
    .line 626
    .line 627
    return v1

    .line 628
    :pswitch_20
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->C0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 629
    .line 630
    .line 631
    return v1

    .line 632
    :pswitch_21
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->D0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 633
    .line 634
    .line 635
    return v1

    .line 636
    :pswitch_22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->H0()V

    .line 637
    .line 638
    .line 639
    return v1

    .line 640
    nop

    .line 641
    :sswitch_data_0
    .sparse-switch
        -0x76e55237 -> :sswitch_22
        -0x712d7f93 -> :sswitch_21
        -0x6dba97bf -> :sswitch_20
        -0x66411b2a -> :sswitch_1f
        -0x5f454948 -> :sswitch_1e
        -0x5e4da358 -> :sswitch_1d
        -0x50635e93 -> :sswitch_1c
        -0x491a8f02 -> :sswitch_1b
        -0x46d2473c -> :sswitch_1a
        -0x41240c84 -> :sswitch_19
        -0x36d0d302 -> :sswitch_18
        -0x3075ca41 -> :sswitch_17
        -0x2e797a69 -> :sswitch_16
        -0x2d814447 -> :sswitch_15
        -0x211cfdfd -> :sswitch_14
        -0x1f8e9982 -> :sswitch_13
        -0x1efdf231 -> :sswitch_12
        -0x1b190611 -> :sswitch_11
        -0x157ef0e2 -> :sswitch_10
        -0x15063f94 -> :sswitch_f
        -0x1384c315 -> :sswitch_e
        -0x102d7fa0 -> :sswitch_d
        -0x347ba9c -> :sswitch_c
        0x4cda631 -> :sswitch_b
        0x8bb3ecc -> :sswitch_a
        0x133b0ea3 -> :sswitch_9
        0x1f398aad -> :sswitch_8
        0x2202689d -> :sswitch_7
        0x291c387e -> :sswitch_6
        0x2afdccba -> :sswitch_5
        0x3efa413b -> :sswitch_4
        0x46fb6a52 -> :sswitch_3
        0x49b0bd5a -> :sswitch_2
        0x6a62b719 -> :sswitch_1
        0x6bfeb91d -> :sswitch_0
    .end sparse-switch

    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public w0(Ll/xc00;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final x0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    const/4 v0, 0x1

    .line 27
    if-ge p3, v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    sub-int/2addr p3, v0

    .line 35
    invoke-virtual {p0, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {p0}, [Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p1, p2, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void
.end method

.method public final y0(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    :try_start_0
    const-string p0, "shownNum"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object p1, p1, Ll/dkb;->G2:Ll/wyd0;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dkb;->H2:Ll/byd0;

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public final z0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    :try_start_0
    const-string v0, "type"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "userId"

    .line 14
    .line 15
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :cond_1
    const-string v1, "match"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-static {p1, p2, v0, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    new-instance v0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$c;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$c;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const-string v1, "see"

    .line 56
    .line 57
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_3

    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/4 p2, 0x1

    .line 82
    invoke-virtual {p0, p2}, Lrx/c;->take(I)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p0, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    new-instance p2, Ll/gci0;

    .line 95
    .line 96
    invoke-direct {p2, p1}, Ll/gci0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_3
    const-string p2, "quick_chat"

    .line 108
    .line 109
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eqz p2, :cond_4

    .line 114
    .line 115
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    new-instance v0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$d;

    .line 120
    .line 121
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$d;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    const-string p0, "none"

    .line 129
    .line 130
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_5

    .line 135
    .line 136
    const-string p0, "cards"

    .line 137
    .line 138
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    .line 151
    .line 152
    :catch_0
    :cond_5
    :goto_0
    return-void
.end method
