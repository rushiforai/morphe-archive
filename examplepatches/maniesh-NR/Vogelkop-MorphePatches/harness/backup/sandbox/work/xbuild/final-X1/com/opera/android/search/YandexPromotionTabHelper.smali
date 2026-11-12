.class public final Lcom/opera/android/search/YandexPromotionTabHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lp12;

.field public b:J

.field public final c:Leco;


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Leej;Lt5d;Lx5f;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Leco;

    invoke-direct {v0, p0}, Leco;-><init>(Lcom/opera/android/search/YandexPromotionTabHelper;)V

    iput-object v0, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->c:Leco;

    invoke-static {p0, p1}, LJ/N;->MBXzlX8k(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->b:J

    new-instance v1, Lp12;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v2

    sget-object v3, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p1}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lcz4;

    invoke-direct {v3, p1}, Lcz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v2, v1, Lp12;->b:Ljava/lang/Object;

    iput-object v3, v1, Lp12;->e:Ljava/lang/Object;

    iput-object p3, v1, Lp12;->c:Ljava/lang/Object;

    iput-object p2, v1, Lp12;->d:Ljava/lang/Object;

    sget-object p1, Lvml;->d:Lumi;

    const/4 p2, 0x0

    new-array p2, p2, [Lbg1;

    const-string v2, "yandex_search_deal"

    invoke-static {p3, p1, v2, p2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, v1, Lp12;->a:Ljava/lang/Object;

    iput-object p4, v1, Lp12;->f:Ljava/lang/Object;

    iput-object v1, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->a:Lp12;

    sget-object p0, Llx3;->a:Li7f;

    invoke-virtual {p0, v0}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final askToSetAsDefault(Ljava/lang/String;I)V
    .registers 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p1, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->a:Lp12;

    new-instance v0, Lp94;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p2, v1}, Lp94;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p1}, Lp12;->b()Z

    move-result p0

    if-nez p0, :cond_12

    invoke-virtual {v0}, Lp94;->run()V

    return-void

    :cond_12
    iget-object p0, p1, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p2, "infobar_shown_before"

    const/4 v1, 0x0

    invoke-interface {p0, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    iget-object p2, p1, Lp12;->c:Ljava/lang/Object;

    check-cast p2, Lt5d;

    if-nez p0, :cond_33

    invoke-virtual {p2}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    new-instance p2, Lbco;

    invoke-direct {p2, p1, p0, p0, v1}, Lbco;-><init>(Lp12;Landroid/content/res/Resources;Landroid/content/res/Resources;B)V

    goto :goto_3d

    :cond_33
    invoke-virtual {p2}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    new-instance p2, Lbco;

    const/4 v1, 0x1

    invoke-direct {p2, p1, p0, p0, v1}, Lbco;-><init>(Lp12;Landroid/content/res/Resources;Landroid/content/res/Resources;B)V

    :goto_3d
    new-instance p0, Ls2g;

    const/16 v1, 0x10

    invoke-direct {p0, p1, v0, p2, v1}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p1, Lp12;->g:Ljava/lang/Object;

    check-cast p1, Leri;

    const/4 p2, 0x0

    if-eqz p1, :cond_4f

    invoke-interface {p1, p2, p0}, Leri;->h(Leh7;Lcom/opera/api/Callback;)Lhh4;

    return-void

    :cond_4f
    invoke-virtual {p0, p2}, Ls2g;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final canAskToSetAsDefault(Ljava/lang/String;)Z
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->a:Lp12;

    invoke-virtual {p0}, Lp12;->b()Z

    move-result p0

    return p0
.end method

.method public final destroy()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->c:Leco;

    sget-object v1, Llx3;->a:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->a:Lp12;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->b:J

    return-void
.end method
