.class public final La4m;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lk6l;

.field public final d:Lv3m;

.field public final e:Lwt3;

.field public final f:Lkwf;

.field public final g:Lswf;

.field public final h:Loz3;

.field public final i:Lwt3;

.field public j:Lf6l;

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Lk6l;Lv3m;Lwt3;Loz3;Lkwf;Lswf;Lwt3;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La4m;->a:Landroid/content/Context;

    iput-object p2, p0, La4m;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, La4m;->c:Lk6l;

    iput-object p4, p0, La4m;->d:Lv3m;

    iput-object p5, p0, La4m;->e:Lwt3;

    iput-object p7, p0, La4m;->f:Lkwf;

    iput-object p8, p0, La4m;->g:Lswf;

    iput-object p6, p0, La4m;->h:Loz3;

    iput-object p9, p0, La4m;->i:Lwt3;

    invoke-virtual {p0}, La4m;->Y()Z

    move-result p1

    if-eqz p1, :cond_21

    invoke-virtual {p3, p0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object p1

    iput-object p1, p0, La4m;->j:Lf6l;

    :cond_21
    return-void
.end method

.method public static X(Lszb;Lszb;)Z
    .registers 5

    if-eqz p1, :cond_23

    sget-object v0, Lszb;->i:Lszb;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    sget-object v2, Lszb;->j:Lszb;

    if-nez v1, :cond_17

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_17
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    :cond_23
    const/4 p0, 0x0

    return p0

    :cond_25
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_31

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->i:Z

    if-nez p2, :cond_31

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, La4m;->W(Lb2l;Z)Z

    move-result p2

    if-eqz p2, :cond_31

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->isLoading()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_1e

    iput-boolean v0, p0, La4m;->l:Z

    return-void

    :cond_1e
    invoke-static {p1}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p1

    if-eqz p1, :cond_27

    iget-object p1, p1, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_28

    :cond_27
    const/4 p1, 0x0

    :goto_28
    if-eqz p1, :cond_31

    iput-boolean v0, p0, La4m;->k:Z

    iget-wide p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {p0, p1}, LJ/N;->M7l2fkee(J)V

    :cond_31
    return-void
.end method

.method public final O(Lb2l;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    iget-boolean v0, p0, La4m;->k:Z

    if-eqz v0, :cond_79

    const/4 v0, 0x0

    iput-boolean v0, p0, La4m;->k:Z

    invoke-virtual {p0, p1, v0}, La4m;->W(Lb2l;Z)Z

    move-result p1

    if-eqz p1, :cond_79

    const/16 p1, 0x2d

    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v1, v3, :cond_1c

    invoke-static {p2, v2}, Lszb;->h(Ljava/lang/String;Ljava/lang/String;)Lszb;

    move-result-object p2

    goto :goto_2a

    :cond_1c
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v4, p2}, Lszb;->h(Ljava/lang/String;Ljava/lang/String;)Lszb;

    move-result-object p2

    :goto_2a
    invoke-virtual {p3, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ne p1, v3, :cond_35

    invoke-static {p3, v2}, Lszb;->h(Ljava/lang/String;Ljava/lang/String;)Lszb;

    move-result-object p1

    goto :goto_43

    :cond_35
    invoke-virtual {p3, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p3, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lszb;->h(Ljava/lang/String;Ljava/lang/String;)Lszb;

    move-result-object p1

    :goto_43
    iget-object p3, p0, La4m;->d:Lv3m;

    invoke-virtual {p3, p2}, Lv3m;->h(Lszb;)Z

    move-result v0

    if-nez v0, :cond_51

    invoke-virtual {p3, p1}, Lv3m;->h(Lszb;)Z

    move-result v0

    if-eqz v0, :cond_79

    :cond_51
    iget-object v0, p3, Lv3m;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lybh;->h(Landroid/content/Context;)Lszb;

    move-result-object v0

    if-eqz v0, :cond_69

    invoke-static {v0, p2}, La4m;->X(Lszb;Lszb;)Z

    move-result v1

    if-nez v1, :cond_79

    invoke-static {v0, p1}, La4m;->X(Lszb;Lszb;)Z

    move-result v0

    if-nez v0, :cond_79

    :cond_69
    invoke-virtual {p3}, Lv3m;->d()Lszb;

    move-result-object p3

    invoke-static {p3, p2}, La4m;->X(Lszb;Lszb;)Z

    move-result p2

    if-nez p2, :cond_79

    invoke-static {p3, p1}, La4m;->X(Lszb;Lszb;)Z

    move-result p1

    if-eqz p1, :cond_7a

    :cond_79
    return-void

    :cond_7a
    invoke-virtual {p0}, La4m;->Z()V

    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    const/4 p1, 0x0

    iput-boolean p1, p0, La4m;->k:Z

    return-void
.end method

.method public final S(Ld7l;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, La4m;->k:Z

    return-void
.end method

.method public final W(Lb2l;Z)Z
    .registers 6

    iget-object v0, p0, La4m;->e:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_64

    iget-object v0, p0, La4m;->d:Lv3m;

    iget-object v2, v0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v2}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-virtual {p0}, La4m;->Y()Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-static {p1}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v2

    if-eqz v2, :cond_64

    iget v2, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->O:I

    if-lez v2, :cond_2a

    return v1

    :cond_2a
    const/4 v2, 0x1

    if-nez p2, :cond_41

    invoke-virtual {v0}, Lv3m;->g()Z

    move-result p2

    if-nez p2, :cond_64

    iget-object p2, p0, La4m;->b:Lcom/opera/android/settings/SettingsManager;

    iget-boolean v0, p2, Lcom/opera/android/settings/SettingsManager;->h:Z

    if-eqz v0, :cond_3b

    move p2, v2

    goto :goto_3f

    :cond_3b
    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result p2

    :goto_3f
    if-nez p2, :cond_64

    :cond_41
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_64

    iget-object p1, p0, La4m;->f:Lkwf;

    sget-object p2, Lqwf;->e:Lqwf;

    invoke-virtual {p1, p2}, Lkwf;->t(Lqwf;)Z

    move-result p1

    if-eqz p1, :cond_64

    iget-object p0, p0, La4m;->g:Lswf;

    iget-object p0, p0, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {p0, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    return v2

    :cond_64
    return v1
.end method

.method public final Y()Z
    .registers 4

    iget-object p0, p0, La4m;->a:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "translate_web_pages.tap_to_access_feature_hint.shown"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "translate_web_pages.show_ui_from_page_menu.clicked"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez v0, :cond_21

    if-nez p0, :cond_21

    const/4 p0, 0x1

    return p0

    :cond_21
    return v2
.end method

.method public final Z()V
    .registers 4

    iget-object v0, p0, La4m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "feature_tips_notification"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, La4m;->i:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_15

    :cond_14
    return-void

    :cond_15
    new-instance v1, Lioc;

    const/4 v2, 0x3

    invoke-direct {v1, v2, v0, p0}, Lioc;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iget-object p0, p0, La4m;->h:Loz3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final j(Lb2l;)V
    .registers 3

    iget-boolean v0, p0, La4m;->l:Z

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    iput-boolean v0, p0, La4m;->l:Z

    invoke-static {p1}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p1

    if-eqz p1, :cond_10

    iget-object p1, p1, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    if-eqz p1, :cond_1b

    const/4 v0, 0x1

    iput-boolean v0, p0, La4m;->k:Z

    iget-wide p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {p0, p1}, LJ/N;->M7l2fkee(J)V

    :cond_1b
    return-void
.end method
