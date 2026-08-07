.class public Ll/i7j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/data/RecommendMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "text"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/RecommendMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "chat_gift"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/i7j;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;

    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1, p4}, Ll/em2;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 19
    .line 20
    sget-object p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->MOMENT_GREET:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 21
    .line 22
    if-ne p0, p4, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    :goto_0
    iget-object p4, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 28
    .line 29
    invoke-static {p4, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    check-cast p5, Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-virtual {p2, p1, p3, p5}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->Y(Ll/oql;Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    const/high16 p0, 0x41800000    # 16.0f

    .line 5
    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 11
    .line 12
    const/high16 p0, 0x42dc0000    # 110.0f

    .line 13
    .line 14
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 19
    .line 20
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final q(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/h7j;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h7j;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final r()Z
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "card_greeting_entrance"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return p0

    .line 12
    :catch_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->P1()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p4, :cond_7

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    if-nez p4, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRecommendMessage()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-virtual {p0, p4}, Ll/i7j;->q(Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result p4

    .line 31
    if-nez p4, :cond_1

    .line 32
    .line 33
    return v0

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/i7j;->r()Z

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    if-nez p4, :cond_2

    .line 39
    .line 40
    return v0

    .line 41
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    iget-boolean p4, p4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canGreet:Z

    .line 46
    .line 47
    if-nez p4, :cond_3

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 50
    .line 51
    .line 52
    move-result-object p4

    .line 53
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRecommendMessage()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    invoke-virtual {p0, p4}, Ll/i7j;->t(Ljava/util/List;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    :cond_3
    const/4 v0, 0x1

    .line 68
    :cond_4
    if-eqz v0, :cond_7

    .line 69
    .line 70
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 73
    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    if-nez p2, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    const/high16 p0, 0x432c0000    # 172.0f

    .line 80
    .line 81
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_6
    :goto_0
    const/high16 p0, 0x43220000    # 162.0f

    .line 90
    .line 91
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 96
    .line 97
    .line 98
    :goto_1
    const/high16 p0, 0x432a0000    # 170.0f

    .line 99
    .line 100
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 105
    .line 106
    .line 107
    :cond_7
    return v0
.end method

.method public final t(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/g7j;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/g7j;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
