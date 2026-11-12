.class public final Luw1;
.super Lc59;
.source "SourceFile"


# instance fields
.field public final synthetic n:B


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lumi;Lj59;B)V
    .registers 5

    .line 7
    iput-byte p4, p0, Luw1;->n:B

    invoke-direct {p0, p1, p2, p3}, Lc59;-><init>(Landroid/content/Context;Lumi;Lj59;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lumi;Lj59;Ljava/lang/String;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Luw1;->n:B

    invoke-direct {p0, p1, p2, p3, p4}, Lc59;-><init>(Landroid/content/Context;Lumi;Lj59;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    iget-byte v0, p0, Luw1;->n:B

    iget-object v1, p0, Lc59;->a:Landroid/content/Context;

    packed-switch v0, :pswitch_data_5c

    invoke-super {p0, p1, p2, p3}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    :pswitch_b
    invoke-super {p0, p1, p2, p3}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-static {v1}, Lhd;->o(Landroid/content/Context;)Lhd;

    move-result-object p0

    iget-object p1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_48

    invoke-static {p1}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v0, "npt_unsent_fcm_token"

    invoke-interface {p3, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p1}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    const/4 p3, 0x0

    invoke-interface {p2, v0, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-boolean p3, p0, Lhd;->b:Z

    if-nez p3, :cond_48

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_48

    const/4 p3, 0x1

    iput-boolean p3, p0, Lhd;->b:Z

    new-instance p3, Lkse;

    invoke-direct {p3, p0, p1, p2}, Lkse;-><init>(Lhd;Landroid/content/Context;Ljava/lang/String;)V

    :cond_48
    return-void

    :pswitch_49
    invoke-super {p0, p1, p2, p3}, Lc59;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    sget-boolean p0, Lxw1;->a:Z

    if-nez p0, :cond_53

    sput-object p2, Lxw1;->c:Ljava/lang/String;

    goto :goto_5a

    :cond_53
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p0

    invoke-virtual {p0, v1, p2}, Lcom/appsflyer/AppsFlyerLib;->updateServerUninstallToken(Landroid/content/Context;Ljava/lang/String;)V

    :goto_5a
    return-void

    nop

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_49
        :pswitch_b
    .end packed-switch
.end method
