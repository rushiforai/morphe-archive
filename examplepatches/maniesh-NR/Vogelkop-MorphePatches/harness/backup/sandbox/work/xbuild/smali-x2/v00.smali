.class public final Lv00;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lru9;

.field public c:Ljava/lang/Boolean;

.field public d:Loml;


# direct methods
.method public constructor <init>(Ltcc;Lhjf;Lumi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lv00;->a:Lumi;

    invoke-static {p2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p3

    iput-object p3, p0, Lv00;->b:Lru9;

    sget-object p3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    check-cast p3, Lcom/opera/android/OperaApplication;

    invoke-virtual {p3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p3

    new-instance v0, Lt00;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lt00;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p3, p1, v0}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    invoke-virtual {p0, p2}, Lv00;->c(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 14

    const-string v0, "Domain"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Name"

    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Value"

    invoke-virtual {p1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v4, "HttpOnly"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "Max-Age"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-string v6, "Secure"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    const-string v6, "SameSite"

    invoke-virtual {p1, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1}, Lrm5;->c0(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13a

    const/4 v7, 0x0

    move v8, v7

    :goto_38
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    const/16 v10, 0x7f

    const/16 v11, 0x20

    if-ge v8, v9, :cond_5f

    invoke-virtual {v2, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-gt v11, v9, :cond_55

    if-ge v9, v10, :cond_55

    const-string v10, " \\\",;"

    invoke-static {v10, v9}, Lkotlin/text/StringsKt;->F(Ljava/lang/CharSequence;C)Z

    move-result v9

    if-nez v9, :cond_55

    add-int/lit8 v8, v8, 0x1

    goto :goto_38

    :cond_55
    const-string p0, "Invalid value: "

    invoke-virtual {p0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-void

    :cond_5f
    const-string v8, "="

    invoke-static {v1, v8, v2}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lrm5;->b0(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_130

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v8, "; Domain="

    invoke-static {v1, v8, v2}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "; Max-Age="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v4, :cond_90

    const-string v2, "; HttpOnly"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_90
    if-eqz v3, :cond_98

    const-string v2, "; Secure"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_98
    move v2, v7

    :goto_99
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, "None"

    if-ge v2, v4, :cond_ac

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-gt v11, v4, :cond_e2

    if-ge v4, v10, :cond_e2

    add-int/lit8 v2, v2, 0x1

    goto :goto_99

    :cond_ac
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    const v8, -0x352aa137    # -6991716.5f

    if-eq v4, v8, :cond_da

    const v8, 0x1a1a3

    if-eq v4, v8, :cond_cf

    const v8, 0x33af38

    if-ne v4, v8, :cond_e2

    const-string v4, "none"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e2

    move-object v2, v5

    goto :goto_e6

    :cond_cf
    const-string v4, "lax"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e2

    const-string v2, "Lax"

    goto :goto_e6

    :cond_da
    const-string v4, "strict"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e4

    :cond_e2
    const/4 v2, 0x0

    goto :goto_e6

    :cond_e4
    const-string v2, "Strict"

    :goto_e6
    if-eqz v2, :cond_126

    invoke-virtual {v2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f6

    if-nez v3, :cond_f6

    const-string p0, "SameSite=None can only be set with Secure"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_f6
    const-string v3, "; SameSite="

    invoke-static {v1, v3, v2}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    const-string v3, "https"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    new-instance v2, Lcom/opera/android/browser/chromium/OperaBrowserContext;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lxa;

    const/16 v3, 0x8

    invoke-direct {v2, p0, p1, v3}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v7, v0, v1, v2}, LJ/N;->MtwtLBqE(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_126
    const-string p0, "Invalid samesite: "

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-void

    :cond_130
    const-string p0, "Invalid domain: "

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-void

    :cond_13a
    const-string p0, "Invalid name: "

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .registers 4

    iget-object v0, p0, Lv00;->d:Loml;

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_8
    new-instance v0, Lu00;

    invoke-direct {v0, p0, p1, v1}, Lu00;-><init>(Lv00;Landroid/content/Context;B)V

    iget-object p1, p0, Lv00;->a:Lumi;

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    iput-object v0, p0, Lv00;->d:Loml;

    sget-object p0, Lpn7;->b:Lon7;

    const/4 p0, 0x0

    sget-object p1, Lun7;->e:Lun7;

    invoke-static {p0, p1}, Lcs5;->x0(ILun7;)J

    move-result-wide p0

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    return-void
.end method

.method public final c(Landroid/content/Context;)V
    .registers 5

    sget-object v0, Lcak;->d:Lavj;

    const/16 v0, 0x9

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_78

    new-instance v0, Lz3;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lz3;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    const-string v1, "personalized_ads"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_72

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object p0

    new-instance p1, Lo8f;

    const/16 v1, 0x15

    invoke-direct {p1, v0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Le00;->g:Ljava/util/ArrayList;

    if-eqz v0, :cond_3e

    new-instance v1, Lb00;

    invoke-direct {v1, p0, p1, v2}, Lb00;-><init>(Le00;Lo8f;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_3e
    iget-object v0, p0, Le00;->e:Lc00;

    if-eqz v0, :cond_4c

    iget-boolean p0, v0, Lc00;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :cond_4c
    iget-object v0, p0, Le00;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc00;

    iget-boolean v1, v0, Lc00;->c:Z

    if-eqz v1, :cond_68

    iget-object v1, p0, Le00;->f:Lnrl;

    iget-boolean v2, v1, Lnrl;->a:Z

    if-nez v2, :cond_68

    new-instance v0, Lb00;

    const/4 v2, 0x1

    invoke-direct {v0, p0, p1, v2}, Lb00;-><init>(Le00;Lo8f;B)V

    invoke-virtual {v1, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void

    :cond_68
    iget-boolean p0, v0, Lc00;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :cond_72
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_78
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Lu00;

    invoke-direct {v1, p0, p1, v2}, Lu00;-><init>(Lv00;Landroid/content/Context;B)V

    invoke-static {v0, v1}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method
