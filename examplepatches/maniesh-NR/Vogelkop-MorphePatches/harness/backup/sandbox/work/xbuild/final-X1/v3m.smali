.class public final Lv3m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lj4c;

.field public final d:Lplk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Lj4c;Lumi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lv3m;->a:Landroid/content/Context;

    iput-object p2, p0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lv3m;->c:Lj4c;

    new-instance p2, Lk32;

    const/16 p3, 0xa

    invoke-direct {p2, p0, p1, p3}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    new-instance p1, Lplk;

    invoke-direct {p1, p0, p4, p2}, Lplk;-><init>(Lv3m;Lumi;Lk32;)V

    iput-object p1, p0, Lv3m;->d:Lplk;

    return-void
.end method

.method public static c(Landroid/content/Context;)Ljava/util/Set;
    .registers 3

    sget-object v0, Lio7;->A:Lio7;

    sget-object v1, Lbvn;->k:Lsjn;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lbvn;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavn;

    iget-object p0, p0, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public static f(Landroid/content/Context;)Z
    .registers 2

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-static {p0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method


# virtual methods
.method public final a(I)Ljava/lang/String;
    .registers 6

    iget-object v0, p0, Lv3m;->c:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq6e;

    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0, p0}, Lp8f;->H(Lq6e;Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lybh;->h(Landroid/content/Context;)Lszb;

    move-result-object p0

    if-eqz v0, :cond_69

    const-string v0, "Google Translate"

    invoke-static {p1, v0}, Laik;->d(Ljava/lang/String;Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v0

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_69

    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v2, :cond_69

    sget-object v1, Lszb;->k:Lszb;

    if-ne p0, v1, :cond_3e

    const-string p0, "\u042f\u043d\u0434\u0435\u043a\u0441.\u041f\u0435\u0440\u0435\u0432\u043e\u0434\u0447\u0438\u043a"

    goto :goto_40

    :cond_3e
    const-string p0, "Yandex Translate"

    :goto_40
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_69
    return-object p1
.end method

.method public final b(Ljava/lang/String;)Lszb;
    .registers 5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_39

    sget-object v0, Lio7;->A:Lio7;

    sget-object v1, Lbvn;->k:Lsjn;

    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lbvn;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavn;

    iget-object p0, p0, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_22
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lszb;

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    return-object v1

    :cond_39
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()Lszb;
    .registers 3

    iget-object v0, p0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "translate_web_pages_to_language"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lszb;->d(ILjava/lang/String;)Lszb;

    move-result-object v0

    invoke-virtual {p0, v0}, Lv3m;->h(Lszb;)Z

    move-result v1

    if-nez v1, :cond_14

    const/4 v0, 0x0

    :cond_14
    if-eqz v0, :cond_17

    return-object v0

    :cond_17
    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lybh;->h(Landroid/content/Context;)Lszb;

    move-result-object p0

    if-eqz p0, :cond_2d

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3b

    :cond_2d
    sget-object p0, Lwwc;->a:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lszb;->h(Ljava/lang/String;Ljava/lang/String;)Lszb;

    move-result-object p0

    :cond_3b
    if-eqz p0, :cond_44

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    return-object p0

    :cond_44
    sget-object p0, Lszb;->e:Lszb;

    return-object p0
.end method

.method public final e(Lszb;I)Z
    .registers 5

    if-eqz p1, :cond_2e

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object p0, p0, Lplk;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_2e

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li0c;

    iget-object v1, v0, Li0c;->a:Lszb;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    iget p0, v0, Li0c;->b:I

    if-ne p0, p2, :cond_2e

    const/4 p0, 0x1

    return p0

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 2

    iget-object p0, p0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "translate_web_pages_enabled"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final h(Lszb;)Z
    .registers 2

    if-eqz p1, :cond_10

    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final i(Lszb;)V
    .registers 5

    iget-object v0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lv3m;->g()Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Lszb;->j:Lszb;

    const/4 v1, 0x1

    sget-object v2, Lszb;->i:Lszb;

    if-eq p1, v2, :cond_1b

    if-eq p1, v0, :cond_1b

    invoke-virtual {p0, p1, v1, v1}, Lv3m;->j(Lszb;IZ)V

    return-void

    :cond_1b
    invoke-virtual {p0, v2, v1, v1}, Lv3m;->j(Lszb;IZ)V

    invoke-virtual {p0, v0, v1, v1}, Lv3m;->j(Lszb;IZ)V

    :cond_21
    return-void
.end method

.method public final j(Lszb;IZ)V
    .registers 6

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object v0, p0, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Lf4m;

    invoke-direct {v1, p0, p1, p3, p2}, Lf4m;-><init>(Lplk;Lszb;ZI)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    return-void
.end method
