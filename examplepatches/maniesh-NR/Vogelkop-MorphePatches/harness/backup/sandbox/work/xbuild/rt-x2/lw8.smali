.class public final synthetic Llw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmw8;


# direct methods
.method public synthetic constructor <init>(Lmw8;B)V
    .registers 3

    iput-byte p2, p0, Llw8;->a:B

    iput-object p1, p0, Llw8;->b:Lmw8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Llw8;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Llw8;->b:Lmw8;

    packed-switch p1, :pswitch_data_90

    iget-object p1, p0, Lnv9;->k:Lnrl;

    iget-object v1, p0, Lnv9;->l:Ljava/lang/Object;

    iput-boolean v0, p1, Lnrl;->a:Z

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    invoke-interface {p1, v1}, Lqp5;->accept(Ljava/lang/Object;)V

    iget-object p1, p0, Lmw8;->q:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "collect_website_categories"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_58

    const-string v1, "collect_partner_visits"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_58

    const-string v1, "process_news_topics"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_58

    const-string v3, "process_location"

    invoke-virtual {p1, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_58

    const-string v3, "news_is_blocked_by_personalization_change"

    invoke-virtual {p1, v0, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    const-string v0, "personalized_news"

    invoke-virtual {p1, v2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p1, v2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object p1, p0, Lmw8;->p:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v2, v0}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    goto :goto_62

    :cond_58
    iget-object p1, p0, Lmw8;->r:Lgjm;

    new-instance v1, Lpb6;

    invoke-direct {v1}, Lpb6;-><init>()V

    invoke-virtual {p1, v1, v0}, Lgjm;->e(Ln37;Z)V

    :goto_62
    iget-object p1, p0, Lmw8;->t:Lkw8;

    iget-object p1, p1, Lk8;->b:Ljava/lang/Object;

    check-cast p1, Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "news_personalized_news_card_accepted"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lnv9;->w()V

    return-void

    :pswitch_7f
    iget-object p1, p0, Lnv9;->k:Lnrl;

    iget-object v1, p0, Lnv9;->m:Ljava/lang/Object;

    iput-boolean v0, p1, Lnrl;->a:Z

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    invoke-interface {p1, v1}, Lqp5;->accept(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lnv9;->w()V

    return-void

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_7f
    .end packed-switch
.end method
