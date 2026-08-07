.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lv/VFrame;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public h:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public i:Lcom/p1/mobile/putong/data/User;

.field public j:Ll/kcg0;


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

.method public static synthetic D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->F(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->h:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->i:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object p3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 13
    .line 14
    sget p4, Lcom/p1/mobile/putong/core/R$string;->r1:I

    .line 15
    .line 16
    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p3, " "

    .line 24
    .line 25
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q0d0;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->i:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/api/g;->xh(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->i:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-direct {v2, p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;Landroid/os/Handler;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p2, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->g2(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Landroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->E(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->f:Lv/VFrame;

    .line 14
    .line 15
    new-instance v1, Ll/p0d0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/p0d0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->q(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->i:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const-string p1, "receiver_user_id"

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "e_clone_swipe_to_bottom"

    .line 23
    .line 24
    const-string v0, "p_suggest_users_home_view"

    .line 25
    .line 26
    invoke-static {p1, v0, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/dmf;->r()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
