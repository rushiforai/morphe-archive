.class public Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"

# interfaces
.implements Ll/d0r;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/zk6;",
        "Ll/gl6;",
        ">;",
        "Ll/d0r;"
    }
.end annotation


# static fields
.field public static f:Ljava/lang/String; = "all_pair_width"

.field public static g:Ljava/lang/String; = "search_type"

.field public static h:Ljava/lang/String; = "ext_key"

.field public static i:Ljava/lang/String; = "conversation_id"

.field public static j:Ljava/lang/String; = "is_only_message_search"

.field public static k:Ljava/lang/String; = "ext_cid_conv"

.field public static l:Ljava/lang/String; = "ext_cid_msg"

.field public static m:I = 0x1

.field public static n:I = 0x2

.field public static o:I = 0x3


# instance fields
.field public e:Ll/f0r;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->k2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->i2()V

    return-void
.end method

.method public static c2(Landroid/content/Context;ILjava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->f:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->j:Ljava/lang/String;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->h:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->l:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public static d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 7

    .line 1
    const/high16 v0, 0x42560000    # 53.5f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    neg-int v2, v0

    .line 8
    sget v4, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->n:I

    .line 9
    .line 10
    new-instance v5, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v6, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v3, ""

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->c2(Landroid/content/Context;ILjava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->i:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->j:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method private e2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e:Ll/f0r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f0r;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e:Ll/f0r;

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/qk6;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/qk6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/rk6;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/rk6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private synthetic i2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->g2()Ll/zk6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->h2()Ll/gl6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public finish()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Ll/zk6;

    .line 8
    .line 9
    iget v1, v1, Ll/zk6;->e:I

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->m:I

    .line 12
    .line 13
    if-eq v1, v2, :cond_1

    .line 14
    .line 15
    check-cast v0, Ll/zk6;

    .line 16
    .line 17
    iget v0, v0, Ll/zk6;->e:I

    .line 18
    .line 19
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->o:I

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    sget v0, Ll/x7c0;->z:I

    .line 27
    .line 28
    sget v1, Ll/x7c0;->B:I

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    sget v0, Ll/x7c0;->e:I

    .line 35
    .line 36
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public g2()Ll/zk6;
    .locals 1

    .line 1
    new-instance v0, Ll/zk6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zk6;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public h(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gl6;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gl6;->h(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h2()Ll/gl6;
    .locals 1

    .line 1
    new-instance v0, Ll/gl6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gl6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public initDataOnCreate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pk6;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/pk6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic k2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e:Ll/f0r;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e:Ll/f0r;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 23
    .line 24
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->e:Ll/f0r;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gl6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gl6;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_chat_search"

    .line 2
    .line 3
    return-object p0
.end method

.method public setTransparentStatusBar()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/16 v0, 0x410

    .line 11
    .line 12
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
