.class public Ll/ywc0;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lv/VLinear;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Lv/VLinear;

.field public j:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Medium;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ll/ywc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ywc0;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/ywc0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ywc0;->G(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    sget-object p2, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 16
    .line 17
    const/4 p3, 0x0

    .line 18
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Ll/lhn;->a(Ljava/lang/String;)Ll/lhn$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p2, p0, Ll/ywc0;->l:Lv/VImage;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/lhn$a;->e()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/ywc0;->m:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/lhn$a;->d()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {p2}, Ll/dkb;->o9()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance p2, Ll/wwc0;

    .line 69
    .line 70
    invoke-direct {p2, p0}, Ll/wwc0;-><init>(Ll/ywc0;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/ywc0;->i:Lv/VLinear;

    .line 81
    .line 82
    new-instance p2, Ll/xwc0;

    .line 83
    .line 84
    invoke-direct {p2, p0}, Ll/xwc0;-><init>(Ll/ywc0;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zwc0;->a(Ll/ywc0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ywc0;->i:Lv/VLinear;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x0

    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v1, v2

    .line 39
    :cond_1
    :goto_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_intl_add_mine_relation_goals_button"

    .line 5
    .line 6
    const-string v1, "p_suggest_user_profile_info_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, ""

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->e2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ywc0;->F(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
