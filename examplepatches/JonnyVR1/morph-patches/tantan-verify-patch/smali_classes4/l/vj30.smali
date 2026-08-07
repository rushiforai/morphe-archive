.class public Ll/vj30;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile e:Ll/vj30;


# instance fields
.field public a:I

.field public b:Z

.field public c:Lcom/p1/mobile/putong/core/data/Recommended;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/vj30;->a:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/vj30;->b:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/uxj0;)V
    .locals 9

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Recommended;->userId:Ljava/lang/String;

    .line 5
    .line 6
    const/16 v7, 0x8

    .line 7
    .line 8
    const-string v8, ""

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    move-object v0, p1

    .line 16
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Recommended;->tracker:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/f49;->v3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/ij30;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/ij30;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/jj30;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Ll/jj30;-><init>(Lcom/p1/mobile/putong/core/data/Recommended;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/kj30;

    .line 39
    .line 40
    invoke-direct {v1, p2, p0, p1}, Ll/kj30;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/lj30;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/lj30;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 24
    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->matched:Z

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic d(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Lcom/p1/mobile/putong/core/data/Recommended;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {p8}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p8

    .line 7
    invoke-virtual {p8}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p8

    .line 11
    invoke-virtual {p8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p8

    .line 15
    invoke-virtual {v0, p0, p8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "\u5fc3\u52a8\u4fe1\u53f7"

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    sget p0, Ll/dbc0;->u8:I

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p4, Lcom/p1/mobile/putong/core/data/Recommended;->reason:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    invoke-virtual {p3, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/sj30;

    .line 38
    .line 39
    invoke-direct {p0, p6, p7, p4}, Ll/sj30;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p5, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Landroid/view/View;)V
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 2
    .line 3
    const/16 p3, 0xe

    .line 4
    .line 5
    if-ne p0, p3, :cond_0

    .line 6
    .line 7
    const-string p0, "1"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "2"

    .line 11
    .line 12
    :goto_0
    const-string p3, "position"

    .line 13
    .line 14
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p3, "nomatch_guide_type"

    .line 19
    .line 20
    const-string v0, "funchat"

    .line 21
    .line 22
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    filled-new-array {p0, p3}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p3, "e_nomatch_svip_guide"

    .line 31
    .line 32
    const-string v0, "p_messages_view"

    .line 33
    .line 34
    invoke-static {p3, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/fj30;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/fj30;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p2, p0}, Ll/vj30;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/x20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic g()V
    .locals 1

    .line 1
    invoke-static {}, Ll/vj30;->s()Ll/vj30;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vj30;->y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/a5i0;->s0()I

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-gtz p4, :cond_0

    .line 6
    .line 7
    new-instance p2, Ll/tj30;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/tj30;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->p0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    const-string v0, "p_message,nomatch_guide"

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, p2, p4, v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->p1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v6, Ll/uj30;

    .line 25
    .line 26
    invoke-direct {v6}, Ll/uj30;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    const/4 v4, 0x1

    .line 31
    const-string v5, ""

    .line 32
    .line 33
    move-object v1, p0

    .line 34
    move-object v2, p2

    .line 35
    invoke-static/range {v1 .. v6}, Ll/a8d0;->r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget p0, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 39
    .line 40
    const/16 p1, 0xe

    .line 41
    .line 42
    if-ne p0, p1, :cond_1

    .line 43
    .line 44
    const-string p0, "1"

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const-string p0, "2"

    .line 48
    .line 49
    :goto_1
    const-string p1, "position"

    .line 50
    .line 51
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "nomatch_guide_type"

    .line 56
    .line 57
    const-string p2, "quickchat"

    .line 58
    .line 59
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_nomatch_svip_guide"

    .line 68
    .line 69
    const-string p2, "p_messages_view"

    .line 70
    .line 71
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic j(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p8}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->w(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "\u5373\u523b\u95ea\u804a"

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    sget p0, Ll/dbc0;->k8:I

    .line 18
    .line 19
    invoke-virtual {p2, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "\u7acb\u5373\u8499\u9762\u804a\u5929"

    .line 23
    .line 24
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-virtual {p3, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/rj30;

    .line 32
    .line 33
    invoke-direct {p0, p5, p8, p6, p7}, Ll/rj30;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p4, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/data/Recommended;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Recommended;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m(Ll/x20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public static synthetic n()V
    .locals 1

    .line 1
    invoke-static {}, Ll/vj30;->s()Ll/vj30;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vj30;->z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 2
    .line 3
    const/16 p3, 0xe

    .line 4
    .line 5
    if-ne p0, p3, :cond_0

    .line 6
    .line 7
    const-string p0, "1"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "2"

    .line 11
    .line 12
    :goto_0
    const-string p3, "position"

    .line 13
    .line 14
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p3, "nomatch_guide_type"

    .line 19
    .line 20
    const-string v0, "see"

    .line 21
    .line 22
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    filled-new-array {p0, p3}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p3, "e_nomatch_svip_guide"

    .line 31
    .line 32
    const-string v0, "p_messages_view"

    .line 33
    .line 34
    invoke-static {p3, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string p2, "p_message,nomatch_guide"

    .line 40
    .line 41
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/seepage/match/FakeMatchAct;->b2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 2
    .line 3
    const/16 p2, 0xe

    .line 4
    .line 5
    if-ne p0, p2, :cond_0

    .line 6
    .line 7
    const-string p0, "1"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "2"

    .line 11
    .line 12
    :goto_0
    const-string p2, "position"

    .line 13
    .line 14
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p2, "nomatch_guide_type"

    .line 19
    .line 20
    const-string v0, "quickchat"

    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    filled-new-array {p0, p2}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p2, "e_nomatch_svip_guide"

    .line 31
    .line 32
    const-string v0, "p_messages_view"

    .line 33
    .line 34
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    const-string p0, "\u95ea\u804a\u641c\u7d22\u4e2d, \u8bf7\u7a0d\u540e"

    .line 48
    .line 49
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget-object p2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;->ChatTop:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;

    .line 58
    .line 59
    const-string v0, "p_message,nomatch_guide"

    .line 60
    .line 61
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->s0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/x20;)V
    .locals 3

    .line 1
    new-instance v0, Ll/gj30;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/gj30;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/hj30;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/hj30;-><init>(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    const-string v2, "p_message,nomatch_guide"

    .line 14
    .line 15
    invoke-static {p0, p2, v1, v2, p1}, Ll/upm;->F(Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/y20;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static s()Ll/vj30;
    .locals 2

    .line 1
    sget-object v0, Ll/vj30;->e:Ll/vj30;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/vj30;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/vj30;->e:Ll/vj30;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/vj30;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/vj30;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/vj30;->e:Ll/vj30;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/vj30;->e:Ll/vj30;

    .line 27
    .line 28
    return-object v0
.end method

.method public static t()V
    .locals 2

    .line 1
    sget-object v0, Ll/vj30;->e:Ll/vj30;

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
    const-class v0, Ll/vj30;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    sget-object v1, Ll/vj30;->e:Ll/vj30;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sput-object v1, Ll/vj30;->e:Ll/vj30;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw v1

    .line 30
    :cond_1
    return-void
.end method

.method public static u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->n8:I

    .line 4
    .line 5
    invoke-virtual {v0, p2, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 6
    .line 7
    .line 8
    const-string p2, "\u5373\u523b\u95ea\u804a"

    .line 9
    .line 10
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    sget p2, Ll/dbc0;->k8:I

    .line 14
    .line 15
    invoke-virtual {p4, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    const-string p2, "\u7acb\u5373\u8499\u9762\u804a\u5929"

    .line 19
    .line 20
    invoke-virtual {p5, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p5, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    sget p3, Ll/c9c0;->k0:I

    .line 32
    .line 33
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p5, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    new-instance p2, Ll/nj30;

    .line 41
    .line 42
    invoke-direct {p2, p1, p0}, Ll/nj30;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p6, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 49
    .line 50
    const/16 p1, 0xe

    .line 51
    .line 52
    if-ne p0, p1, :cond_0

    .line 53
    .line 54
    const-string p0, "1"

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-string p0, "2"

    .line 58
    .line 59
    :goto_0
    const-string p1, "position"

    .line 60
    .line 61
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "nomatch_guide_type"

    .line 66
    .line 67
    const-string p2, "quickchat"

    .line 68
    .line 69
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string p1, "e_nomatch_svip_guide"

    .line 78
    .line 79
    const-string p2, "p_messages_view"

    .line 80
    .line 81
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object v7, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->y:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/c9c0;->k0:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object v1, v7, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, p0, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/ej30;

    .line 31
    .line 32
    move-object v6, p0

    .line 33
    move-object v8, p2

    .line 34
    move-object v1, p3

    .line 35
    move-object v2, p4

    .line 36
    move-object v3, p5

    .line 37
    move-object v4, p6

    .line 38
    move-object/from16 v5, p7

    .line 39
    .line 40
    invoke-direct/range {v0 .. v8}, Ll/ej30;-><init>(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/mj30;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/mj30;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    iget p0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 56
    .line 57
    const/16 p1, 0xe

    .line 58
    .line 59
    if-ne p0, p1, :cond_0

    .line 60
    .line 61
    const-string p0, "1"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const-string p0, "2"

    .line 65
    .line 66
    :goto_0
    const-string p1, "position"

    .line 67
    .line 68
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "nomatch_guide_type"

    .line 73
    .line 74
    const-string p2, "quickchat"

    .line 75
    .line 76
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "e_nomatch_svip_guide"

    .line 85
    .line 86
    const-string p2, "p_messages_view"

    .line 87
    .line 88
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object v5, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->x:Lcom/p1/mobile/putong/core/data/Recommended;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/c9c0;->k0:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/Recommended;->userId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, p0, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/pj30;

    .line 31
    .line 32
    move-object v8, p0

    .line 33
    move-object v7, p2

    .line 34
    move-object v1, p3

    .line 35
    move-object v2, p4

    .line 36
    move-object v3, p5

    .line 37
    move-object v4, p6

    .line 38
    move-object/from16 v6, p7

    .line 39
    .line 40
    invoke-direct/range {v0 .. v8}, Ll/pj30;-><init>(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Lcom/p1/mobile/putong/core/data/Recommended;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/qj30;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/qj30;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    iget p0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 56
    .line 57
    const/16 p1, 0xe

    .line 58
    .line 59
    if-ne p0, p1, :cond_0

    .line 60
    .line 61
    const-string p0, "1"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const-string p0, "2"

    .line 65
    .line 66
    :goto_0
    const-string p1, "position"

    .line 67
    .line 68
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "nomatch_guide_type"

    .line 73
    .line 74
    const-string p2, "funchat"

    .line 75
    .line 76
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "e_nomatch_svip_guide"

    .line 85
    .line 86
    const-string p2, "p_messages_view"

    .line 87
    .line 88
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->z:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {p2, v1, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->x(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    const-string p2, "\u5979"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p2, "\u4ed6"

    .line 25
    .line 26
    :goto_0
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v1, "%s\u559c\u6b22\u4f60"

    .line 31
    .line 32
    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    sget p2, Ll/dbc0;->t8:I

    .line 40
    .line 41
    invoke-virtual {p4, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p5, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget p3, Ll/c9c0;->k0:I

    .line 52
    .line 53
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {p5, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    const-string p3, "\u5728\u7b49\u4f60\u56de\u5e94"

    .line 69
    .line 70
    if-nez p2, :cond_7

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-interface {p2, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->vn(Lcom/p1/mobile/putong/data/User;)J

    .line 77
    .line 78
    .line 79
    move-result-wide v1

    .line 80
    const-wide/16 v3, 0x0

    .line 81
    .line 82
    cmp-long p2, v1, v3

    .line 83
    .line 84
    if-lez p2, :cond_1

    .line 85
    .line 86
    goto/16 :goto_1

    .line 87
    .line 88
    :cond_1
    iget-object p2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 89
    .line 90
    iget p2, p2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 91
    .line 92
    const/16 p4, 0x2710

    .line 93
    .line 94
    if-le p2, p4, :cond_4

    .line 95
    .line 96
    new-instance p2, Ljava/util/Date;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v1

    .line 102
    invoke-direct {p2, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 103
    .line 104
    .line 105
    new-instance p4, Ljava/util/Date;

    .line 106
    .line 107
    invoke-static {}, Ll/pzi0;->o()J

    .line 108
    .line 109
    .line 110
    move-result-wide v1

    .line 111
    invoke-direct {p4, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p4}, Ljava/util/Date;->getTime()J

    .line 115
    .line 116
    .line 117
    move-result-wide v1

    .line 118
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    .line 119
    .line 120
    .line 121
    move-result-wide v3

    .line 122
    sub-long/2addr v1, v3

    .line 123
    const-wide/32 v3, 0x36ee80

    .line 124
    .line 125
    .line 126
    div-long v3, v1, v3

    .line 127
    .line 128
    const-wide/16 v5, 0x18

    .line 129
    .line 130
    cmp-long p2, v3, v5

    .line 131
    .line 132
    if-lez p2, :cond_2

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    const-wide/16 p2, 0x1

    .line 136
    .line 137
    cmp-long p2, v3, p2

    .line 138
    .line 139
    if-lez p2, :cond_3

    .line 140
    .line 141
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    const-string p3, "%s\u5c0f\u65f6\u524d\u6d3b\u8dc3"

    .line 150
    .line 151
    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p3

    .line 155
    goto :goto_1

    .line 156
    :cond_3
    const-wide/32 p2, 0xea60

    .line 157
    .line 158
    .line 159
    div-long/2addr v1, p2

    .line 160
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    const-string p3, "%s\u5206\u949f\u524d\u6d3b\u8dc3"

    .line 169
    .line 170
    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p3

    .line 174
    goto :goto_1

    .line 175
    :cond_4
    const/16 p3, 0x3e8

    .line 176
    .line 177
    if-le p2, p3, :cond_5

    .line 178
    .line 179
    new-instance p2, Ljava/text/DecimalFormat;

    .line 180
    .line 181
    const-string p3, "0.0"

    .line 182
    .line 183
    invoke-direct {p2, p3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object p3, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 187
    .line 188
    iget p3, p3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 189
    .line 190
    int-to-float p3, p3

    .line 191
    const/high16 p4, 0x447a0000    # 1000.0f

    .line 192
    .line 193
    div-float/2addr p3, p4

    .line 194
    float-to-double p3, p3

    .line 195
    invoke-virtual {p2, p3, p4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    const-string p3, "\u79bb\u4f60%skm"

    .line 204
    .line 205
    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p3

    .line 209
    goto :goto_1

    .line 210
    :cond_5
    const/16 p3, 0x1f4

    .line 211
    .line 212
    if-le p2, p3, :cond_6

    .line 213
    .line 214
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    const-string p3, "\u79bb\u4f60%sm"

    .line 223
    .line 224
    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p3

    .line 228
    goto :goto_1

    .line 229
    :cond_6
    const-string p3, "\u79bb\u4f60500m"

    .line 230
    .line 231
    :cond_7
    :goto_1
    invoke-virtual {p5, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    new-instance p2, Ll/oj30;

    .line 235
    .line 236
    invoke-direct {p2, p1, p0, v0}, Ll/oj30;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 237
    .line 238
    .line 239
    invoke-static {p6, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 240
    .line 241
    .line 242
    iget p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 243
    .line 244
    const/16 p1, 0xe

    .line 245
    .line 246
    if-ne p0, p1, :cond_8

    .line 247
    .line 248
    const-string p0, "1"

    .line 249
    .line 250
    goto :goto_2

    .line 251
    :cond_8
    const-string p0, "2"

    .line 252
    .line 253
    :goto_2
    const-string p1, "position"

    .line 254
    .line 255
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    const-string p1, "nomatch_guide_type"

    .line 260
    .line 261
    const-string p2, "see"

    .line 262
    .line 263
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    const-string p1, "e_nomatch_svip_guide"

    .line 272
    .line 273
    const-string p2, "p_messages_view"

    .line 274
    .line 275
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 276
    .line 277
    .line 278
    return-void
.end method


# virtual methods
.method public y()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/vj30;->d:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->U1:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/vj30;->c:Lcom/p1/mobile/putong/core/data/Recommended;

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->U1:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
