.class public Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/v3m;


# instance fields
.field public c:Lv/VImage;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/data/User;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->h:Z

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->R(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p2, Ll/cxa0;

    .line 5
    .line 6
    invoke-direct {p2, p0, p1, p5}, Ll/cxa0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dxa0;->a(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string p3, ""

    .line 4
    .line 5
    invoke-static {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/match/b;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "showfrom_sayhi"

    .line 9
    .line 10
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/match/b;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p2, "other_user_id"

    .line 19
    .line 20
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "e_odiamond_sayhi"

    .line 31
    .line 32
    const-string p2, "p_suggest_user_profile_info_view"

    .line 33
    .line 34
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public getEnvelopSayHai()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->g:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->h:Z

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    const-string p1, "showfrom_sayhi"

    .line 10
    .line 11
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/match/b;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    const-string p2, ""

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    const-string p3, "other_user_id"

    .line 27
    .line 28
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string p2, "e_odiamond_sayhi"

    .line 37
    .line 38
    const-string p3, "p_suggest_user_profile_info_view"

    .line 39
    .line 40
    invoke-static {p2, p3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileOneBtnMatchSendView;->h:Z

    .line 45
    .line 46
    :cond_1
    return-void
.end method
