.class public Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;
.implements Ll/mzl;
.implements Ll/ucq;


# static fields
.field public static r:Ll/xyd0;

.field public static s:Ll/jxd0;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/data/Conversation;

.field public d:Z

.field public e:Z

.field public f:Ll/clz;

.field public g:Ll/qzz;

.field public h:Ll/ruy;

.field public i:Ll/u1z;

.field public j:Ll/d3z;

.field public k:Ll/vez;

.field public l:Ll/n2;

.field public m:Ll/g500;

.field public n:Ll/hi40;

.field public o:Ll/ki40;

.field public p:Ll/l300;

.field public q:Ll/s000;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/xyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "sent_foul_words_users_set_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ljava/util/HashSet;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 34
    .line 35
    new-instance v0, Ll/jxd0;

    .line 36
    .line 37
    const-string v1, "enter_as_send_alert"

    .line 38
    .line 39
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s:Ll/jxd0;

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->e:Z

    .line 11
    .line 12
    return-void
.end method

.method public static N2(Landroid/content/Context;Ljava/lang/String;ZZILjava/lang/String;Z)Landroid/content/Intent;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "move_by_message_id"

    .line 12
    .line 13
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    if-eqz p6, :cond_0

    .line 17
    .line 18
    const-string p1, "chat_cell"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p1, ""

    .line 22
    .line 23
    :goto_0
    const-string p2, "ai_from_tag"

    .line 24
    .line 25
    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->K2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->F2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

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
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->I2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->H2(Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->L2(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->M2(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static varargs g2(Landroid/content/Context;Ljava/lang/String;I[Ll/pf60;)Landroid/content/Intent;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "I[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    const/4 v3, 0x0

    .line 2
    const/4 v4, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move v5, p2

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    array-length p1, p3

    .line 12
    const/4 p2, 0x0

    .line 13
    :goto_0
    if-ge p2, p1, :cond_0

    .line 14
    .line 15
    aget-object v0, p3, p2

    .line 16
    .line 17
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    add-int/lit8 p2, p2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-object p0
.end method

.method public static h2(Landroid/content/Context;Ljava/lang/String;ZILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 13

    .line 1
    const-string v10, ""

    .line 2
    .line 3
    const/4 v11, -0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    const/4 v5, 0x0

    .line 7
    const/4 v6, 0x0

    .line 8
    const/4 v9, 0x0

    .line 9
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    move v2, p2

    .line 12
    move/from16 v7, p3

    .line 13
    .line 14
    move-object/from16 v8, p4

    .line 15
    .line 16
    move-object/from16 v12, p5

    .line 17
    .line 18
    invoke-static/range {v0 .. v12}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;ZLjava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static i2(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;I)Landroid/content/Intent;
    .locals 13

    .line 1
    const/4 v8, 0x0

    .line 2
    const-string v12, ""

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v6, 0x0

    .line 9
    const/4 v7, -0x1

    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move v9, p2

    .line 13
    move-object/from16 v10, p3

    .line 14
    .line 15
    move/from16 v11, p4

    .line 16
    .line 17
    invoke-static/range {v0 .. v12}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;ZLjava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, -0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static m2(Landroid/content/Context;Ljava/lang/String;ZZILjava/lang/String;)Landroid/content/Intent;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "presetMsg"

    .line 12
    .line 13
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public static n2(Landroid/content/Context;Ljava/lang/String;ZZIZ)Landroid/content/Intent;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "media_keyboard"

    .line 12
    .line 13
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public static o2(Landroid/content/Context;Ljava/lang/String;ZZLandroid/content/Intent;I)Landroid/content/Intent;
    .locals 8

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move-object v6, p4

    .line 8
    move v7, p5

    .line 9
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static p2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;
    .locals 13

    .line 1
    const/4 v11, -0x1

    .line 2
    const-string v12, ""

    .line 3
    .line 4
    const/4 v8, 0x0

    .line 5
    const/4 v9, 0x0

    .line 6
    const-string v10, ""

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move v2, p2

    .line 11
    move/from16 v3, p3

    .line 12
    .line 13
    move/from16 v4, p4

    .line 14
    .line 15
    move/from16 v5, p5

    .line 16
    .line 17
    move-object/from16 v6, p6

    .line 18
    .line 19
    move/from16 v7, p7

    .line 20
    .line 21
    invoke-static/range {v0 .. v12}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;ZLjava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;
    .locals 13

    .line 1
    const/4 v11, -0x1

    .line 2
    const-string v12, ""

    .line 3
    .line 4
    const/4 v9, 0x0

    .line 5
    const-string v10, ""

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move v2, p2

    .line 10
    move/from16 v3, p3

    .line 11
    .line 12
    move/from16 v4, p4

    .line 13
    .line 14
    move/from16 v5, p5

    .line 15
    .line 16
    move-object/from16 v6, p6

    .line 17
    .line 18
    move/from16 v7, p7

    .line 19
    .line 20
    move-object/from16 v8, p8

    .line 21
    .line 22
    invoke-static/range {v0 .. v12}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;ZLjava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static r2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;ZLjava/lang/String;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2
    const-string p0, "conversationId"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    const-string p0, "userId"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    const-string p0, "FROM"

    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 5
    const-string p0, "keyboardUp"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 6
    const-string p0, "showGiftRain"

    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 7
    const-string p0, "isFromMatchReply"

    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 8
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 9
    invoke-static {v0, p6}, Ll/l51;->p(Landroid/content/Intent;Landroid/content/Intent;)V

    :cond_0
    if-eqz p3, :cond_1

    const/high16 p0, 0x10000000

    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 p0, 0x80000

    .line 11
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 12
    :cond_1
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 13
    const-string p0, "autoSendMessage"

    invoke-virtual {v0, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    :cond_2
    const-string p0, "is_pick_message"

    invoke-virtual {v0, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    const-string p0, "picked_messages"

    invoke-virtual {v0, p0, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    const-string p0, "max_limit"

    invoke-virtual {v0, p0, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 17
    invoke-static {p12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 18
    const-string p0, "appendMsg"

    invoke-virtual {v0, p0, p12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    :cond_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 20
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "MessagesAct: convId = "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " intent = "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " data = "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    :cond_4
    invoke-static {p7}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->z2(I)V

    return-object v0
.end method

.method public static s2(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/String;
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
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/app/Activity;

    .line 14
    .line 15
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public static u2(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "sub_from"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static z2(I)V
    .locals 1

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/16 v0, 0x1d

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ta(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public A2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public B0()Ll/u1z;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->i:Ll/u1z;

    .line 2
    .line 3
    return-object p0
.end method

.method public final B2(Ll/j3z;Ll/iam;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Ll/j3z;->f0(Ll/mzl;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ll/ar2;->Z()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C2()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vez;->F0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public E2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public F()Ll/ruy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->h:Ll/ruy;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic F2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->U2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H2(Ljava/lang/String;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Ll/r97;->l0()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 p3, 0x1

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p2}, Ll/r97;->J()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    new-instance v0, Ll/y800;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/y800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p2, p4, v0, p3}, Ll/r97;->N1(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return p3
.end method

.method public final synthetic I2(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "from_message"

    .line 18
    .line 19
    invoke-interface {v1, v2, v3}, Ll/r97;->M3(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/u800;

    .line 24
    .line 25
    invoke-direct {v2, p0, p1}, Ll/u800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic K2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->U2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L2(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/qzz;->B1()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/d3z;->E1()V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic M2(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/qzz;->B1()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/d3z;->E1()V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public Q2(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    instance-of v0, p0, Ll/tvz;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/tvz;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Ll/tvz;->xg(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public R2(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, "text"

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lez v1, :cond_2

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    instance-of v3, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    const-string v0, "picture"

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    const-string v0, "video"

    .line 51
    .line 52
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    return-void
.end method

.method public S2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->T2(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public T2(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

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
    invoke-interface {v0, p2}, Ll/r97;->z(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p2}, Ll/r97;->l0()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-interface {p2}, Ll/r97;->J()Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    new-instance v0, Ll/s800;

    .line 58
    .line 59
    invoke-direct {v0, p0, p1}, Ll/s800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    invoke-interface {p2, p3, v0, p0}, Ll/r97;->N1(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-interface {p2}, Ll/r97;->l0()Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_2

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    new-instance v0, Ll/t800;

    .line 94
    .line 95
    invoke-direct {v0, p0, p1}, Ll/t800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const/4 p0, 0x1

    .line 99
    invoke-interface {p2, p3, v0, p0}, Ll/r97;->N1(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->U2(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public U2(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "other_user_id"

    .line 18
    .line 19
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "message_type"

    .line 24
    .line 25
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v1, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v1, "e_secret_message"

    .line 34
    .line 35
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "p_chat_view,e_secret_message,click"

    .line 51
    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 53
    .line 54
    invoke-interface {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p1}, Ll/r97;->U2()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance v0, Ll/v800;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/v800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/dkb;->o9()Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance v0, Ll/w800;

    .line 102
    .line 103
    invoke-direct {v0}, Ll/w800;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance v0, Ll/x800;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Ll/x800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public checkGradientColors()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d0()Ll/vez;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k:Ll/vez;

    .line 2
    .line 3
    return-object p0
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/clz;->Z2()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

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
    invoke-interface {v0}, Ll/r97;->M4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k0()Ll/s000;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ll/s000;->k0(Landroid/view/MotionEvent;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1}, Ll/u1z;->m1(Landroid/view/MotionEvent;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_1
    :try_start_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return p0

    .line 39
    :catch_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public e2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/d3z;->Y()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/d3z;->A1()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l:Ll/n2;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l:Ll/n2;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/n2;->e()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/o3z;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Ll/o3z;->a:Ll/wyd0;

    .line 37
    .line 38
    const-string v1, ""

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-interface {p0}, Ll/ucq;->s0()V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->W1:Lrx/subjects/b;

    .line 61
    .line 62
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ll/r97;->n5()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 90
    .line 91
    iget v0, v0, Ll/clz;->d:I

    .line 92
    .line 93
    const/4 v1, 0x7

    .line 94
    if-eq v1, v0, :cond_3

    .line 95
    .line 96
    const/16 v1, 0x1f

    .line 97
    .line 98
    if-ne v1, v0, :cond_4

    .line 99
    .line 100
    :cond_3
    const/4 v0, -0x1

    .line 101
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 102
    .line 103
    .line 104
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->w()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_5

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 119
    .line 120
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0}, Ll/rvm;->f(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 126
    .line 127
    if-eqz v0, :cond_6

    .line 128
    .line 129
    invoke-virtual {v0}, Ll/clz;->y6()V

    .line 130
    .line 131
    .line 132
    :cond_6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/qzz;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 6

    .line 1
    invoke-static {}, Ll/l600;->b()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/ucq;->s0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "conversationId"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    const-string v1, "userId"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const/4 v3, 0x1

    .line 52
    const/4 v4, 0x0

    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 56
    .line 57
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 58
    .line 59
    if-lez v2, :cond_2

    .line 60
    .line 61
    move v2, v3

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    move v2, v4

    .line 64
    :goto_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->e:Z

    .line 65
    .line 66
    :cond_3
    const-string v2, "is_pick_message"

    .line 67
    .line 68
    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d:Z

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 75
    .line 76
    invoke-static {v2, v1}, Ll/pm6;->b(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_4

    .line 81
    .line 82
    new-instance v1, Ll/ggz;

    .line 83
    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 85
    .line 86
    invoke-direct {v1, p0, v2}, Ll/ggz;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 90
    .line 91
    new-instance v1, Ll/lgz;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/lgz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 100
    .line 101
    const/4 v5, 0x0

    .line 102
    if-nez v2, :cond_5

    .line 103
    .line 104
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 107
    .line 108
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 109
    .line 110
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, Ljava/lang/CharSequence;

    .line 115
    .line 116
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-eqz v2, :cond_5

    .line 121
    .line 122
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-nez v2, :cond_5

    .line 127
    .line 128
    new-instance v2, Ll/jlz;

    .line 129
    .line 130
    invoke-direct {v2, p0, v5, v1}, Ll/jlz;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 137
    .line 138
    if-nez v2, :cond_6

    .line 139
    .line 140
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d:Z

    .line 141
    .line 142
    if-eqz v2, :cond_6

    .line 143
    .line 144
    new-instance v2, Ll/klz;

    .line 145
    .line 146
    invoke-direct {v2, p0, v5, v1}, Ll/klz;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 150
    .line 151
    invoke-virtual {v2, v3}, Ll/clz;->b7(Z)V

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_6
    new-instance v1, Ll/tvz;

    .line 156
    .line 157
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 158
    .line 159
    invoke-direct {v1, p0, v2}, Ll/tvz;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 160
    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 163
    .line 164
    :goto_1
    new-instance v1, Ll/yxz;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Ll/yxz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 167
    .line 168
    .line 169
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 170
    .line 171
    :goto_2
    const-string v1, "push_type"

    .line 172
    .line 173
    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 178
    .line 179
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 180
    .line 181
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 182
    .line 183
    .line 184
    new-instance v1, Ll/u1z;

    .line 185
    .line 186
    invoke-direct {v1, p0}, Ll/u1z;-><init>(Ll/ner;)V

    .line 187
    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->i:Ll/u1z;

    .line 190
    .line 191
    new-instance v1, Ll/d3z;

    .line 192
    .line 193
    invoke-direct {v1, p0}, Ll/d3z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 194
    .line 195
    .line 196
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 197
    .line 198
    if-lez v0, :cond_7

    .line 199
    .line 200
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-interface {v1}, Ll/r97;->h1()Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-eqz v1, :cond_7

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 215
    .line 216
    invoke-virtual {v1, v0}, Ll/d3z;->O1(I)V

    .line 217
    .line 218
    .line 219
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->i:Ll/u1z;

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->j:Ll/d3z;

    .line 222
    .line 223
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 224
    .line 225
    .line 226
    new-instance v0, Ll/hi40;

    .line 227
    .line 228
    invoke-direct {v0, p0}, Ll/hi40;-><init>(Ll/ner;)V

    .line 229
    .line 230
    .line 231
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->n:Ll/hi40;

    .line 232
    .line 233
    new-instance v0, Ll/ki40;

    .line 234
    .line 235
    invoke-direct {v0, p0}, Ll/ki40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 236
    .line 237
    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->o:Ll/ki40;

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->n:Ll/hi40;

    .line 241
    .line 242
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 243
    .line 244
    .line 245
    new-instance v0, Ll/vez;

    .line 246
    .line 247
    invoke-direct {v0, p0}, Ll/vez;-><init>(Ll/ner;)V

    .line 248
    .line 249
    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k:Ll/vez;

    .line 251
    .line 252
    new-instance v0, Ll/ffz;

    .line 253
    .line 254
    invoke-direct {v0, p0}, Ll/ffz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 255
    .line 256
    .line 257
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l:Ll/n2;

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k:Ll/vez;

    .line 260
    .line 261
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 262
    .line 263
    .line 264
    new-instance v0, Ll/g500;

    .line 265
    .line 266
    invoke-direct {v0, p0}, Ll/g500;-><init>(Ll/ner;)V

    .line 267
    .line 268
    .line 269
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->m:Ll/g500;

    .line 270
    .line 271
    new-instance v0, Ll/i500;

    .line 272
    .line 273
    invoke-direct {v0, p0}, Ll/i500;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 274
    .line 275
    .line 276
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->m:Ll/g500;

    .line 277
    .line 278
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 279
    .line 280
    .line 281
    new-instance v0, Ll/l300;

    .line 282
    .line 283
    invoke-direct {v0, p0}, Ll/l300;-><init>(Ll/ner;)V

    .line 284
    .line 285
    .line 286
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p:Ll/l300;

    .line 287
    .line 288
    new-instance v0, Ll/n300;

    .line 289
    .line 290
    invoke-direct {v0, p0}, Ll/n300;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 291
    .line 292
    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p:Ll/l300;

    .line 294
    .line 295
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 296
    .line 297
    .line 298
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 299
    .line 300
    invoke-static {v0}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    if-eqz v0, :cond_8

    .line 305
    .line 306
    new-instance v0, Ll/avy;

    .line 307
    .line 308
    invoke-direct {v0, p0}, Ll/avy;-><init>(Ll/ner;)V

    .line 309
    .line 310
    .line 311
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->h:Ll/ruy;

    .line 312
    .line 313
    new-instance v0, Ll/bvy;

    .line 314
    .line 315
    invoke-direct {v0, p0}, Ll/bvy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 316
    .line 317
    .line 318
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->h:Ll/ruy;

    .line 319
    .line 320
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 321
    .line 322
    .line 323
    goto :goto_3

    .line 324
    :cond_8
    new-instance v0, Ll/fwy;

    .line 325
    .line 326
    invoke-direct {v0, p0}, Ll/fwy;-><init>(Ll/ner;)V

    .line 327
    .line 328
    .line 329
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->h:Ll/ruy;

    .line 330
    .line 331
    new-instance v0, Ll/hwy;

    .line 332
    .line 333
    invoke-direct {v0, p0}, Ll/hwy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 334
    .line 335
    .line 336
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->h:Ll/ruy;

    .line 337
    .line 338
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 339
    .line 340
    .line 341
    :goto_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-interface {v0}, Ll/r97;->M4()Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_9

    .line 354
    .line 355
    new-instance v0, Ll/s000;

    .line 356
    .line 357
    invoke-direct {v0, p0}, Ll/s000;-><init>(Ll/ner;)V

    .line 358
    .line 359
    .line 360
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q:Ll/s000;

    .line 361
    .line 362
    new-instance v0, Ll/h100;

    .line 363
    .line 364
    invoke-direct {v0, p0}, Ll/h100;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 365
    .line 366
    .line 367
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q:Ll/s000;

    .line 368
    .line 369
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B2(Ll/j3z;Ll/iam;)V

    .line 370
    .line 371
    .line 372
    :cond_9
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 373
    .line 374
    .line 375
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->h:Ll/ruy;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/ar2;->a0()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/clz;->a0()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->i:Ll/u1z;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/u1z;->a0()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k:Ll/vez;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vez;->a0()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->m:Ll/g500;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/g500;->a0()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p:Ll/l300;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/l300;->a0()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public k0()Ll/s000;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q:Ll/s000;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ll/clz;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/clz<",
            "+",
            "Lcom/tantanapp/common/data/DbObject;",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public o0()Ll/l300;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p:Ll/l300;

    .line 2
    .line 3
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/clz;->h6(IILandroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->j6()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qzz;->E1(Landroid/view/Menu;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onHomePressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ll/clz;->k6(ILandroid/view/Menu;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/toh0;->i(Landroid/content/Intent;)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/clz;->l6(Landroid/view/MenuItem;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/clz;->m6(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    invoke-virtual {p0, p1, p2}, Ll/clz;->n6(Ljava/util/List;I)V

    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/clz;->o6(Landroid/view/Menu;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public onRecordVideoResult(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/clz;->q6(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 0

    .line 1
    invoke-static {}, Ll/l600;->c()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStopLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onStopLifecycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTakePictureResult(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/clz;->r6(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/qzz;->F1(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->i3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_f

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_5

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isOtherStatusInvalid()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeOneSideConv()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 52
    .line 53
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 54
    .line 55
    if-gtz v0, :cond_1

    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/b;->d()V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 84
    .line 85
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v2, "moments_user_id"

    .line 90
    .line 91
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v2, "ai_from_tag"

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->n7()Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_2

    .line 117
    .line 118
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_2

    .line 123
    .line 124
    const-string v2, "ai_from"

    .line 125
    .line 126
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 134
    .line 135
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v1, v2}, Ll/clz;->w3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-eqz v2, :cond_6

    .line 148
    .line 149
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 150
    .line 151
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Location;->isHideUpdateTime()Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    const-string v3, ""

    .line 156
    .line 157
    if-eqz v2, :cond_3

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 161
    .line 162
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 163
    .line 164
    invoke-virtual {v2, v1}, Ll/ina;->x3(Lcom/p1/mobile/putong/data/User;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_4

    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-nez v2, :cond_5

    .line 176
    .line 177
    invoke-static {v1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    if-nez v2, :cond_5

    .line 182
    .line 183
    invoke-static {}, Ll/pzi0;->o()J

    .line 184
    .line 185
    .line 186
    move-result-wide v4

    .line 187
    long-to-double v4, v4

    .line 188
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 189
    .line 190
    iget-wide v6, v2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 191
    .line 192
    sub-double/2addr v4, v6

    .line 193
    const-wide v6, 0x41a4997000000000L    # 1.728E8

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    cmpl-double v2, v4, v6

    .line 199
    .line 200
    if-lez v2, :cond_5

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->relativeTimeForTrack()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    :goto_0
    const-string v1, "lastactivity_time"

    .line 208
    .line 209
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 217
    .line 218
    invoke-virtual {v1}, Ll/clz;->e4()Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    const-string v2, "0"

    .line 223
    .line 224
    const/4 v3, 0x0

    .line 225
    if-eqz v1, :cond_9

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 228
    .line 229
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    const-string v4, "groupchat_id"

    .line 234
    .line 235
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 243
    .line 244
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 245
    .line 246
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 247
    .line 248
    invoke-virtual {v4}, Ll/clz;->r3()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    if-eqz v4, :cond_7

    .line 261
    .line 262
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 263
    .line 264
    const-string v4, "anonymous"

    .line 265
    .line 266
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    goto :goto_1

    .line 271
    :cond_7
    move v1, v3

    .line 272
    :goto_1
    if-eqz v1, :cond_8

    .line 273
    .line 274
    const-string v1, "1"

    .line 275
    .line 276
    goto :goto_2

    .line 277
    :cond_8
    move-object v1, v2

    .line 278
    :goto_2
    const-string v4, "is_anonymou_group"

    .line 279
    .line 280
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    :cond_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-interface {v1}, Ll/r97;->c()Z

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    if-eqz v1, :cond_b

    .line 300
    .line 301
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 302
    .line 303
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 304
    .line 305
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 306
    .line 307
    invoke-virtual {v4}, Ll/clz;->i3()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result v4

    .line 319
    if-eqz v4, :cond_a

    .line 320
    .line 321
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 322
    .line 323
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 324
    .line 325
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->bell:Z

    .line 326
    .line 327
    if-eqz v1, :cond_a

    .line 328
    .line 329
    const/4 v1, 0x1

    .line 330
    goto :goto_3

    .line 331
    :cond_a
    move v1, v3

    .line 332
    :goto_3
    const-string v4, "is_quickchatbell"

    .line 333
    .line 334
    invoke-static {v4, v1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    :cond_b
    const-string v1, "is_from_specialguest_type"

    .line 342
    .line 343
    invoke-static {v1, v3}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 351
    .line 352
    invoke-virtual {v1}, Ll/clz;->z3()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v1

    .line 356
    const-string v3, "unlocked_highest_heat_level"

    .line 357
    .line 358
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    const-string v1, "is_tbd"

    .line 366
    .line 367
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 375
    .line 376
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result v1

    .line 380
    if-eqz v1, :cond_d

    .line 381
    .line 382
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 383
    .line 384
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatConv()Z

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    if-eqz v1, :cond_d

    .line 389
    .line 390
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 391
    .line 392
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 393
    .line 394
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 395
    .line 396
    .line 397
    move-result-object v1

    .line 398
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 399
    .line 400
    .line 401
    move-result v1

    .line 402
    if-eqz v1, :cond_d

    .line 403
    .line 404
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 413
    .line 414
    invoke-interface {v1, v2}, Ll/r97;->j5(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    if-eqz v1, :cond_c

    .line 419
    .line 420
    const-string v1, "fake_voicechat"

    .line 421
    .line 422
    goto :goto_4

    .line 423
    :cond_c
    const-string v1, "fake_onlinechat"

    .line 424
    .line 425
    :goto_4
    const-string v2, "fake_quickchat_type"

    .line 426
    .line 427
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    :cond_d
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    new-array v1, v1, [Ll/sfj0$a;

    .line 439
    .line 440
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 444
    .line 445
    invoke-static {v1}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 446
    .line 447
    .line 448
    move-result-object v1

    .line 449
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 450
    .line 451
    .line 452
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 453
    .line 454
    .line 455
    invoke-static {}, Ll/h39;->M()Z

    .line 456
    .line 457
    .line 458
    move-result p1

    .line 459
    if-eqz p1, :cond_e

    .line 460
    .line 461
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct$a;

    .line 462
    .line 463
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 467
    .line 468
    .line 469
    :cond_e
    return-void

    .line 470
    :cond_f
    :goto_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 471
    .line 472
    .line 473
    return-void
.end method

.method public setTheme()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTheme()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->w2()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public shouldBlockOnCreate(Landroid/os/Bundle;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnCreate(Landroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public showDebugMenu()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/clz;->o7()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u0()Ll/g500;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->m:Ll/g500;

    .line 2
    .line 3
    return-object p0
.end method

.method public v2()Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    return-object p0
.end method

.method public final w2()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget p0, Ll/cgc0;->j:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    sget p0, Ll/cgc0;->i:I

    .line 19
    .line 20
    return p0
.end method

.method public x0()Ll/hi40;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->n:Ll/hi40;

    .line 2
    .line 3
    return-object p0
.end method

.method public y2()Ll/qzz;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g:Ll/qzz;

    .line 2
    .line 3
    return-object p0
.end method
