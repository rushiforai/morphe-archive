.class public final Lj25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lj25;->a:B

    iput-object p1, p0, Lj25;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 8

    iget-byte v0, p0, Lj25;->a:B

    const-string v1, "enable_sync"

    const-string v2, "compression"

    const/4 v3, 0x0

    iget-object p0, p0, Lj25;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_16a

    check-cast p0, Lydn;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_27

    iget-object p1, p0, Lydn;->m:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_27

    iget-object p1, p0, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_27

    invoke-virtual {p0, v3}, Lydn;->C(Z)V

    :cond_27
    return-void

    :pswitch_28
    const-string v0, "enable_trending_searches"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_35

    check-cast p0, Lm6m;

    invoke-virtual {p0, v3}, Lm6m;->a(Z)V

    :cond_35
    return-void

    :pswitch_36
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_41

    check-cast p0, Lgyk;

    invoke-virtual {p0}, Lgyk;->a()V

    :cond_41
    return-void

    :pswitch_42
    const-string v0, "ga_usage_statistics"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_57

    check-cast p0, Ld6j;

    iget-object p1, p0, Ld6j;->b:Lqfb;

    iget-object p0, p0, Ld6j;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {p1, p0}, Lqfb;->setEnabled(Z)V

    :cond_57
    return-void

    :pswitch_58
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_63

    check-cast p0, Ly4g;

    invoke-virtual {p0}, Ly4g;->S()V

    :cond_63
    return-void

    :pswitch_64
    check-cast p0, Ldyf;

    const-string v0, "enable_newsfeed"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_74

    invoke-virtual {p0}, Ldyf;->d()V

    invoke-virtual {p0}, Ldyf;->c()V

    :cond_74
    return-void

    :pswitch_75
    check-cast p0, Lvbf;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_81

    invoke-virtual {p0}, Lvbf;->q()V

    goto :goto_8c

    :cond_81
    const-string v0, "vpn_search_bypass"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8c

    invoke-virtual {p0}, Lvbf;->v()V

    :cond_8c
    :goto_8c
    return-void

    :pswitch_8d
    check-cast p0, Lsb6;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const-string v1, "process_news_topics"

    const/4 v2, 0x1

    const-string v4, "personalized_news"

    const/4 v5, -0x1

    sparse-switch v0, :sswitch_data_17e

    goto :goto_bf

    :sswitch_9d
    const-string v0, "personalized_default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_bf

    const/4 v3, 0x3

    goto :goto_c0

    :sswitch_a7
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_bf

    const/4 v3, 0x2

    goto :goto_c0

    :sswitch_af
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_bf

    move v3, v2

    goto :goto_c0

    :sswitch_b7
    const-string v0, "personalized_ads"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c0

    :cond_bf
    :goto_bf
    move v3, v5

    :cond_c0
    :goto_c0
    packed-switch v3, :pswitch_data_190

    goto :goto_131

    :pswitch_c4
    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance v0, Lqb6;

    invoke-direct {v0, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lsb6;->I0()V

    goto :goto_131

    :pswitch_e3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v2, v0}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance v0, Lqb6;

    invoke-direct {v0, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0, v4}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {p1, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p0, Lqb6;

    invoke-direct {p0, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    goto :goto_131

    :pswitch_12e
    invoke-virtual {p0}, Lsb6;->I0()V

    :goto_131
    return-void

    :pswitch_132
    check-cast p0, Lr9i;

    const-string v0, "ad_blocking"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_169

    iget-object p1, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_169

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_169

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_169

    invoke-static {p0}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_169

    sget-object p1, Llx3;->a:Li7f;

    invoke-static {p0}, LJ/N;->MvtgjDJV(Ljava/lang/Object;)V

    :cond_169
    return-void

    :pswitch_data_16a
    .packed-switch 0x0
        :pswitch_132
        :pswitch_8d
        :pswitch_75
        :pswitch_64
        :pswitch_58
        :pswitch_42
        :pswitch_36
        :pswitch_28
    .end packed-switch

    :sswitch_data_17e
    .sparse-switch
        -0x32e5283f -> :sswitch_b7
        -0x29b9f21e -> :sswitch_af
        0x1745640 -> :sswitch_a7
        0x305544d2 -> :sswitch_9d
    .end sparse-switch

    :pswitch_data_190
    .packed-switch 0x0
        :pswitch_12e
        :pswitch_e3
        :pswitch_e3
        :pswitch_c4
    .end packed-switch
.end method
