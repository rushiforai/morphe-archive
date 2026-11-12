.class public final Lqgf;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lk6l;

.field public final c:Lkwf;

.field public final d:Lswf;

.field public final e:Ldu3;

.field public final f:Ldu3;

.field public final g:Loz3;

.field public h:Lf6l;

.field public i:Logf;

.field public j:Z

.field public final k:Lcom/opera/android/settings/SettingsManager;

.field public final l:Lcom/opera/android/Lazy;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ldu3;Lk6l;Lkwf;Lswf;Ldu3;Ldu3;Loz3;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqgf;->a:Landroid/content/Context;

    iput-object p3, p0, Lqgf;->b:Lk6l;

    iput-object p4, p0, Lqgf;->c:Lkwf;

    iput-object p5, p0, Lqgf;->d:Lswf;

    iput-object p6, p0, Lqgf;->e:Ldu3;

    iput-object p7, p0, Lqgf;->f:Ldu3;

    iput-object p8, p0, Lqgf;->g:Loz3;

    iput-object p9, p0, Lqgf;->k:Lcom/opera/android/settings/SettingsManager;

    iput-object p10, p0, Lqgf;->l:Lcom/opera/android/Lazy;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p4, "external_apps.page_menu_hint.shown"

    const/4 p5, 0x0

    invoke-interface {p1, p4, p5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_30

    iget-object p1, p2, Ldu3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->Z:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpgf;

    if-nez p1, :cond_31

    :cond_30
    return-void

    :cond_31
    iget-object p1, p1, Lpgf;->h:Lode;

    new-instance p2, Ld8d;

    const/16 p4, 0x11

    invoke-direct {p2, p0, p4}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    invoke-virtual {p3, p0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object p1

    iput-object p1, p0, Lqgf;->h:Lf6l;

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_e

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p2, :cond_e

    const/4 p2, 0x1

    iput-boolean p2, p0, Lqgf;->j:Z

    invoke-virtual {p0, p1}, Lqgf;->W(Lb2l;)V

    :cond_e
    return-void
.end method

.method public final S(Ld7l;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, Lqgf;->j:Z

    return-void
.end method

.method public final W(Lb2l;)V
    .registers 6

    iget-boolean v0, p0, Lqgf;->j:Z

    if-eqz v0, :cond_c0

    if-eqz p1, :cond_c0

    check-cast p1, Ld7l;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    if-nez v0, :cond_c0

    iget-object v0, p0, Lqgf;->i:Logf;

    if-eqz v0, :cond_c0

    invoke-virtual {p1}, Ld7l;->k0()Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Logf;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqgf;->j:Z

    iget-object v1, p0, Lqgf;->i:Logf;

    iget-object v2, p0, Lqgf;->a:Landroid/content/Context;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "external_apps.page_menu_hint.shown"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_c0

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    if-nez p1, :cond_c0

    iget-object p1, v1, Logf;->e:Ljava/lang/String;

    if-eqz p1, :cond_c0

    iget-object v0, p0, Lqgf;->l:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo7;

    iget-object v0, v0, Lvo7;->a:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lro7;

    iget-object v0, v0, Lro7;->a:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_62

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c0

    :cond_62
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_66
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqo7;

    iget-object v1, v1, Lqo7;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_66

    iget-object p1, p0, Lqgf;->c:Lkwf;

    sget-object v0, Lqwf;->t:Lqwf;

    invoke-virtual {p1, v0}, Lkwf;->t(Lqwf;)Z

    move-result p1

    if-eqz p1, :cond_c0

    iget-object p1, p0, Lqgf;->d:Lswf;

    iget-object p1, p1, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c0

    iget-object p1, p0, Lqgf;->e:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_c0

    iget-object p1, p0, Lqgf;->f:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_c0

    iget-object v0, p0, Lqgf;->k:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "feature_tips_notification"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c0

    new-instance v0, Lioc;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1, p0}, Lioc;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iget-object p0, p0, Lqgf;->g:Loz3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_c0
    return-void
.end method

.method public final j(Lb2l;)V
    .registers 2

    invoke-virtual {p0, p1}, Lqgf;->W(Lb2l;)V

    return-void
.end method
