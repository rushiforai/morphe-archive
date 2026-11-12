.class public final Lolh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lglh;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lumi;


# direct methods
.method public constructor <init>(Lglh;Lcom/opera/android/settings/SettingsManager;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lolh;->a:Lglh;

    iput-object p2, p0, Lolh;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lolh;->c:Lumi;

    return-void
.end method

.method public static a(Ldx3;ZZ)V
    .registers 8

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v1, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->C0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lolh;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v2

    if-eqz v2, :cond_34

    new-instance v2, Ljava/io/File;

    iget-object v3, v0, Lcom/opera/android/settings/SettingsManager;->f:Lii;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    const-string v4, "Offline pages"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2, p1}, Ls29;->f(Ljava/io/File;Z)Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_38

    :cond_34
    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object p1

    :goto_38
    new-instance v2, Ls2g;

    const/4 v3, 0x5

    invoke-direct {v2, v1, v0, p1, v3}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0, p1, p2, v2}, Llcp;->G(Ldx3;Landroid/net/Uri;ZLcom/opera/api/Callback;)V

    return-void
.end method

.method public static b(Lilh;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    new-instance v0, Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object v1, p0, Lilh;->b:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    const-string v4, "opera-offline"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_20

    const-string v2, "localhost"

    goto :goto_24

    :cond_20
    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    :goto_24
    invoke-virtual {v3, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    iget-wide v3, p0, Lilh;->a:J

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "offline"

    invoke-direct {v0, v3, v2}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v0, v1}, Lcom/opera/android/browser/UrlMangler$Builder;->externalUrl(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-wide p0, p0, Lilh;->d:J

    const-string v1, "offline_page_timestamp"

    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    invoke-virtual {p1, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static d(Ldx3;Z)V
    .registers 4

    invoke-static {p0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lolh;->a(Ldx3;ZZ)V

    return-void

    :cond_b
    iget-object v0, p0, Ldx3;->j:Lqi;

    new-instance v1, Lnrl;

    invoke-direct {v1, p0, p1}, Lnrl;-><init>(Ljava/lang/Object;Z)V

    const-string p0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, p0, v1}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    return-void
.end method


# virtual methods
.method public final c(Lcom/opera/android/BrowserActivity;Ld7l;Ljava/lang/String;Ljava/lang/String;Lxx1;)V
    .registers 14

    new-instance v0, Lqe9;

    const/4 v7, 0x2

    move-object v1, p0

    move-object v3, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v7}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object p1, v1

    move-object p2, v3

    new-instance p0, Lws1;

    const/16 p5, 0xd

    invoke-direct/range {p0 .. p5}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p1, Lolh;->c:Lumi;

    invoke-virtual {p1, p0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Lr9g;

    const/16 p2, 0x13

    invoke-direct {p1, v0, p2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void
.end method
